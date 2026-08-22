local M = {}
local wezterm = require "wezterm"

---------------------------------------------------------------
--- チートシートの中身
--- keybinds.lua を書き換えたら、ここも合わせて更新すること
---------------------------------------------------------------
M.sections = {
    {
        title = "Tab",
        items = {
            { "ALT+k",        "新規タブ" },
            { "ALT+j",        "タブを閉じる (確認あり)" },
            { "ALT+h / l",    "タブ移動 (左 / 右)" },
            { "ALT+CTRL+h/l", "タブ自体を並べ替え" },
            { "ALT+1〜9",     "タブ番号を指定して移動" },
            { "ALT+F9",       "タブナビゲータを開く" },
        },
    },
    {
        title = "Pane",
        items = {
            { "ALT+\\",         "ペイン分割 (横)" },
            { "ALT+-",          "ペイン分割 (縦)" },
            { "ALT+←↑↓→",       "ペイン移動" },
            { "ALT+CTRL+←↑↓→",  "ペインサイズ変更 (5単位)" },
        },
    },
    {
        title = "Copy / Search",
        items = {
            { "ALT+CTRL+k", "コピーモード開始" },
            { "ALT+CTRL+j", "プライマリセレクションから貼り付け" },
            { "CTRL+SHIFT+c", "クリップボードへコピー" },
            { "ALT+f",      "スクロールバック内を検索 (大小無視)" },
            { "左ドラッグ",   "選択 → プライマリセレクションへ" },
            { "右クリック",   "選択 → クリップボードへ" },
            { "CTRL+左クリック", "カーソル下のリンクを開く" },
        },
    },
    {
        title = "Misc",
        items = {
            { "ALT+t", "背景の透過 ON/OFF トグル" },
            { "ALT+g", "新規タブで lazygit を起動" },
            { "ALT+?", "このチートシートを表示" },
        },
    },
}

---------------------------------------------------------------
--- 整形してファイルに書き出す
---------------------------------------------------------------
local ESC = string.char(27)
local function color(code, s) return ESC .. "[" .. code .. "m" .. s .. ESC .. "[0m" end

-- 全角文字を2幅として数える
local function width(s)
    local w = 0
    for _, cp in utf8.codes(s) do
        if cp > 0x1100 and (
            cp <= 0x115f
            or (cp >= 0x2e80 and cp <= 0xa4cf)
            or (cp >= 0xac00 and cp <= 0xd7a3)
            or (cp >= 0xf900 and cp <= 0xfaff)
            or (cp >= 0xfe30 and cp <= 0xfe6f)
            or (cp >= 0xff00 and cp <= 0xff60)
            or (cp >= 0xffe0 and cp <= 0xffe6)
            or (cp >= 0x1f300 and cp <= 0x1f9ff)
        ) then
            w = w + 2
        else
            w = w + 1
        end
    end
    return w
end

local function pad(s, n)
    local diff = n - width(s)
    if diff > 0 then return s .. string.rep(" ", diff) end
    return s
end

function M.render()
    local lines = {}
    table.insert(lines, "")
    table.insert(lines, "  " .. color("1;36", "WezTerm Keybinds Cheatsheet"))
    table.insert(lines, "")

    for _, section in ipairs(M.sections) do
        table.insert(lines, "  " .. color("1;33", "[" .. section.title .. "]"))
        for _, item in ipairs(section.items) do
            local key, desc = item[1], item[2]
            table.insert(lines, "    " .. color("1;32", pad(key, 18)) .. desc)
        end
        table.insert(lines, "")
    end

    table.insert(lines, "  " .. color("90", "q で閉じる / 定義元: ~/dotfiles/wezterm/keybinds.lua"))
    table.insert(lines, "")
    return table.concat(lines, "\n")
end

-- 書き出し先パス
M.path = os.getenv("HOME") .. "/.cache/wezterm/cheatsheet.txt"

-- 設定読み込み時に呼ぶ。最新の内容をファイルへ吐く
function M.dump()
    wezterm.run_child_process({ "mkdir", "-p", os.getenv("HOME") .. "/.cache/wezterm" })
    local f = io.open(M.path, "w")
    if f then
        f:write(M.render())
        f:close()
    end
    return M.path
end

-- ALT+? に割り当てるアクション
function M.action()
    return wezterm.action.SpawnCommandInNewTab({
        args = {
            "sh", "-c",
            "less -R " .. M.path .. " 2>/dev/null || { cat " .. M.path .. "; read _; }",
        },
        set_environment_variables = { LESSSECURE = "1" },
    })
end

return M
