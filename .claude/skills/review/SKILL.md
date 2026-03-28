---
name: review
description: 現在のブランチまたは指定したPRの変更内容を批判的にレビューする。「/review」または「/review {PR番号}」で呼び出す。コードの正確さ、ドキュメントと実装の整合性、install scriptへのaptパッケージ追加漏れ、Ubuntu環境依存の問題などを確認する。PRを作成する前・レビューを依頼する前・変更内容に不安があるときは必ずこのスキルを使うこと。
allowed-tools: Bash(git diff), Bash(git log), Bash(echo), Bash(gh), Read, Grep, Glob, Edit, Write, Agent
---

## 概要

変更内容を批判的にレビューし、問題点を具体的に指摘する。

## 手順

### Step 1: 差分を取得する

**引数なし**（現在のブランチの変更をレビュー）:
```bash
git diff main...HEAD
git log main...HEAD --oneline
```

**引数がPR番号**:
```bash
gh pr diff {PR番号}
gh pr view {PR番号}
```

変更されたファイルの一覧も確認する:
```bash
git diff main...HEAD --name-only
# または
gh pr diff {PR番号} --name-only
```

### Step 2: 関連ファイルを読む

差分に含まれるファイルの種類に応じて、以下も確認する:

- `scripts/install.sh` — 常に確認する（aptパッケージ追加漏れのチェック）
- `docs/` 以下のファイル — 変更されたzsh/vim/gitなどの設定に対応するdocsを確認
- `.zsh/zshrc/alias.zsh` — エイリアス設定を変更した場合

### Step 3: 別エージェントでレビューを実行する

以下の観点で批判的にレビューするエージェントを起動する。**コードの変更は行わない。**

#### レビュー観点

1. **コードの正確さ・バグの有無**
   - 設定値・コマンドが正しいか
   - Ubuntu固有のパッケージ名の問題（例: `bat` → `batcat`、`fd` → `fdfind`）
   - エイリアスの連鎖が意図通りに動くか
   - シェルの非インタラクティブ実行時にエイリアスが効かない問題（MANPAGERなど）

2. **ドキュメントと実装の整合性**
   - `docs/` の記述が実装と一致しているか
   - 追加したコマンド・エイリアスがdocsに記載されているか
   - コマンド例・設定値がコードと一致しているか

3. **install scriptの漏れ**
   - `apt install` が必要な新規パッケージが `scripts/install.sh` に追加されているか
   - パッケージ名がUbuntuの正式名称と一致しているか

4. **エッジケース・環境依存の問題**
   - Ubuntuのバージョン依存（例: Ubuntu 20.04では存在しないパッケージ）
   - 既存の設定との競合

5. **その他**
   - セキュリティ上の問題
   - 不要なファイルの混入

### Step 4: 結果を報告する

問題があれば **ファイル名・行番号を含めて** 具体的に指摘する。

問題が見つからない場合はその旨を明示する。
