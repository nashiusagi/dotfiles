---
name: issue-driven-dev
description: GitHub issueを起点にした開発ワークフローを実行するスキル。「issue #XX 対応して」「このissueを実装して」「https://github.com/.../issues/XX を対応して」のような依頼が来たら必ずこのスキルを使うこと。issueの読み込み・プラン策定・承認取得・ブランチ作成・実装・PR作成・docs更新まで一連の流れをサポートする。
---

# Issue-Driven Development

GitHub issue を起点にした開発ワークフロー。以下のステップを順番に実行する。

---

## Step 1: issueを読む

issue URL または番号を受け取ったら、まず内容を確認する。

```bash
gh issue view {番号} --repo {owner/repo}
```

URLが渡された場合はURLから番号とリポジトリを抽出する。
カレントディレクトリがそのリポジトリの場合は `--repo` を省略してよい。

---

## Step 2: プランを立ててユーザーに提示する

issueの内容をもとに実装計画を立て、ユーザーに提示する。

提示する内容：
- 変更するファイルと変更内容の概要
- 新規作成するファイル（ある場合）
- ブランチ名の候補（`feature/{issue番号}_{短い説明}` 形式）

**実装はまだ開始しない。ユーザーの承認を待つ。**

---

## Step 3: 承認を得る

ユーザーが「ok」「進めて」「やって」などの承認を出したら、次のステップへ進む。
承認が出るまでは一切コードを変更しない。

---

## Step 4: ブランチを作成する

必ず `main` ブランチから作成する。

```bash
git checkout main
git checkout -b feature/{issue番号}_{短い説明}
```

---

## Step 5: 実装する

プランに従って実装を進める。

### commitのルール（最重要）

**commitする前に必ずユーザーに確認を取ること。**

確認の例：「commitしていいか？」

ユーザーが「ok」と明示的に承認した場合のみ、commitを実行する。
「ok」以外の曖昧な返答ではcommitしない。

```bash
git add {ファイル}
git commit -m "feat: {内容}

Co-Authored-By: Claude Sonnet 4.6 <noreply@anthropic.com>"
```

---

## Step 6: pushしてPRを作成する

commit後、pushしてPRを作成する。これもユーザーの承認後に実行する。

```bash
git push -u origin {ブランチ名}
```

PR作成：
```bash
gh pr create --title "feat: {内容}" --body "$(cat <<'EOF'
closes #{issue番号}

## Summary

- {変更点1}
- {変更点2}

🤖 Generated with [Claude Code](https://claude.com/claude-code)
EOF
)"
```

PRのbodyには必ず `closes #{issue番号}` を含める。

---

## Step 7: docsを更新する

実装内容に関連する `docs/` ディレクトリのドキュメントを確認し、実情と合っていない箇所を更新する。

確認対象の例：
- 追加したコマンド・エイリアスがdocsに記載されているか
- インストール手順が変わっていないか
- 設定項目の説明が正しいか

docs更新後も、**commitの前にユーザーに確認を取ること**。

---

## 重要なルール（まとめ）

1. **プランを提示してから承認を得るまで実装しない**
2. **commitの前に必ず「commitしていいか？」と聞く**
3. **ブランチは必ず `main` から作成する**
4. **PRのbodyには必ず `closes #{issue番号}` を含める**
5. **docs更新もcommit前に確認を取る**
