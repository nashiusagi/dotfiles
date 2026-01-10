# Zsh
## 設定設定

| 項目 | 説明 |
|------|------|
| **プラグイン管理** | zplug |
| **テーマ** | Powerlevel10k |
| **補完** | zsh-completions |
| **Git表示** | git-prompt.sh（ブランチ名、状態を表示） |

## エイリアス
| エイリアス | コマンド |
|-----------|----------|
| `ll` | `ls -lG` |
| `la` | `ls -laG` |
| `...` | `cd ../..` |

## 対応する開発環境
- **Python**: pyenv
- **Ruby**: rbenv
- **Node.js**: nvm, pnpm, bun
- **Java**: SDKMAN
- **Rust**: cargo

## zplugのインストール

```bash
curl -sL --proto-redir -all,https https://raw.githubusercontent.com/zplug/installer/master/installer.zsh | zsh
```
