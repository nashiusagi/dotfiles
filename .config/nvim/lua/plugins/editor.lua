return {
  -- 括弧・クォート自動補完
  { "jiangmiao/auto-pairs", event = "InsertEnter" },

  -- HTMLタグ補完
  { "alvan/vim-closetag", ft = { "html", "xml" } },

  -- コメントトグル (gcc: 行, gc: ビジュアル範囲)
  { "tpope/vim-commentary", keys = { "gc", "gcc" } },

  -- ナビゲーションマッピング
  { "tpope/vim-unimpaired", event = "BufRead" },

  -- カーソル下の識別子をハイライト
  {
    "RRethy/vim-illuminate",
    event = "BufRead",
    config = function()
      require("illuminate").configure({
        delay = 500,
        min_count_to_highlight = 2,
        filetypes_denylist = { "NvimTree", "aerial", "fzf" },
      })
    end,
  },

  -- クイック実行
  { "thinca/vim-quickrun", cmd = "QuickRun" },

  -- Undoツリー可視化
  {
    "mbbill/undotree",
    cmd = "UndotreeToggle",
    keys = { { "<leader>u", "<cmd>UndotreeToggle<CR>" } },
  },

  -- 関数・クラス一覧（aerial）
  {
    "stevearc/aerial.nvim",
    keys = { { "<C-t>", "<cmd>AerialToggle<CR>", silent = true } },
    opts = {
      backends = { "lsp" },
      layout = { min_width = 28 },
    },
  },

  -- プロジェクトルート自動検出
  {
    "airblade/vim-rooter",
    event = "BufRead",
    init = function()
      vim.g.rooter_patterns = { ".git", ".git/" }
    end,
  },

  -- コードフォーマット
  { "prettier/vim-prettier", cmd = "Prettier", ft = { "javascript", "typescript", "css", "html", "json", "markdown" } },
}
