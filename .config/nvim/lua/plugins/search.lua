return {
  -- fzf本体
  {
    "junegunn/fzf",
    build = function()
      vim.fn["fzf#install"]()
    end,
  },

  -- fzf vim統合
  { "junegunn/fzf.vim", dependencies = { "junegunn/fzf" } },

  -- ファイルツリー
  {
    "scrooloose/nerdtree",
    cmd = { "NERDTree", "NERDTreeToggle" },
    keys = { { "<C-e>", ":NERDTreeToggle<CR>", silent = true } },
    dependencies = { "Xuyuanp/nerdtree-git-plugin" },
    init = function()
      vim.g.NERDTreeWinSize = 30
      vim.g.NERDTreeShowHidden = 1
      vim.g.NERDTreeIgnore = { "\\.rbc$", "\\~$", "\\.pyc$", "\\.db$", "\\.sqlite$", "__pycache__" }
      vim.g.NERDTreeSortOrder = { "^__\\.py$", "\\/$", "*", "\\.swp$", "\\.bak$", "\\~$" }
      vim.g.NERDTreeShowBookmarks = 1
      vim.g.NERDTreeChDirMode = 2
      vim.g.NERDTreeMapOpenInTabSilent = "<RightMouse>"
      -- git状態アイコン
      vim.g.NERDTreeGitStatusIndicatorMapCustom = {
        Modified  = "✹", Staged    = "✚", Untracked = "✭",
        Renamed   = "➜", Unmerged  = "═", Deleted   = "✖",
        Dirty     = "✗", Clean     = "✔︎", Ignored   = "☒", Unknown = "?",
      }
      vim.g.NERDTreeGitStatusUseNerdFonts = 0
      vim.g.NERDTreeGitStatusConcealBrackets = 1
    end,
    config = function()
      -- 起動時にNERDTreeを開き、エディタにフォーカス
      vim.api.nvim_create_autocmd("VimEnter", {
        callback = function()
          vim.cmd("NERDTree")
          vim.cmd("wincmd p")
        end,
      })
      -- NERDTreeだけになったら自動で閉じる
      vim.api.nvim_create_autocmd("BufEnter", {
        callback = function()
          if vim.fn.winnr("$") == 1 and vim.b.NERDTree ~= nil and vim.b.NERDTree.isTabTree() then
            vim.cmd("q")
          end
        end,
      })
    end,
  },

  { "Xuyuanp/nerdtree-git-plugin" },
}
