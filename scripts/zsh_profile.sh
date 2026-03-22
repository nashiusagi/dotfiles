#!/bin/bash
#==============================================================#
#  zsh_profile.sh - zsh 起動パフォーマンス計測スクリプト
#
#  使い方:
#    ./scripts/zsh_profile.sh          # デフォルト5回計測
#    ./scripts/zsh_profile.sh -n 10    # 回数指定
#    ./scripts/zsh_profile.sh -s       # 起動時間のみ
#    ./scripts/zsh_profile.sh -p       # zprof 上位10件のみ
#    ./scripts/zsh_profile.sh -p -n 3  # 組み合わせ可
#==============================================================#

set -e

# --- デフォルト値 ---
RUNS=5
SHOW_TIME=true
SHOW_ZPROF=true
ZPROF_TOP=10

# --- 引数パース ---
while getopts "n:sp" opt; do
  case $opt in
    n) RUNS="$OPTARG" ;;
    s) SHOW_ZPROF=false ;;
    p) SHOW_TIME=false ;;
    *) echo "usage: $0 [-n runs] [-s] [-p]" >&2; exit 1 ;;
  esac
done

# --- 起動時間計測 ---
measure_time() {
  local start end elapsed
  start=$(date +%s%3N)
  zsh -i -c exit > /dev/null 2>&1
  end=$(date +%s%3N)
  echo $(( end - start ))
}

# --- 起動時間の計測・集計 ---
if "$SHOW_TIME"; then
  echo "=== zsh startup time ($RUNS runs) ==="
  total=0
  min=99999
  max=0
  for i in $(seq 1 "$RUNS"); do
    ms=$(measure_time)
    printf "  run %2d: %dms\n" "$i" "$ms"
    total=$(( total + ms ))
    [ "$ms" -lt "$min" ] && min=$ms
    [ "$ms" -gt "$max" ] && max=$ms
  done
  avg=$(( total / RUNS ))
  echo "  ------"
  printf "  avg:    %dms\n" "$avg"
  printf "  min:    %dms\n" "$min"
  printf "  max:    %dms\n" "$max"
  echo ""
fi

# --- zprof 上位N件表示 ---
if "$SHOW_ZPROF"; then
  echo "=== top $ZPROF_TOP slowest (zprof) ==="
  ZSHRC_PROFILE=1 zsh -i -c exit 2>/dev/null \
    | grep -v "^num\|^---\|^$" \
    | head -"$ZPROF_TOP" \
    | awk '{
        num = $1; gsub(")", "", num)
        time = $3
        pct = $5; gsub("%", "", pct)
        name = $9
        printf "  %2s. %-45s %6.2fms (%s%%)\n", num, name, time, pct
      }'
  echo ""
fi
