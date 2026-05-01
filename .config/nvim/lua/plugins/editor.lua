return {
  -- 括弧・クォート自動補完
  { "windwp/nvim-autopairs", event = "InsertEnter", opts = {} },

  -- HTMLタグ補完
  { "alvan/vim-closetag", commit = "d0a562f8bdb107a50595aefe53b1a690460c3822", ft = { "html", "xml" } },

  -- コメントトグル (gcc: 行, gc: ビジュアル範囲)
  { "tpope/vim-commentary", commit = "64a654ef4a20db1727938338310209b6a63f60c9", keys = { "gc", "gcc" } },

  -- ナビゲーションマッピング
  { "tpope/vim-unimpaired", commit = "db65482581a28e4ccf355be297f1864a4e66985c", event = "VeryLazy" },

  -- カーソル下の識別子をハイライト
  {
    "RRethy/vim-illuminate",
    commit = "0d1e93684da00ab7c057410fecfc24f434698898",
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
  { "thinca/vim-quickrun", commit = "77b4d6ea9972a206f02c736882c2398c36d2983c", cmd = "QuickRun" },

  -- Undoツリー可視化
  {
    "mbbill/undotree",
    commit = "6fa6b57cda8459e1e4b2ca34df702f55242f4e4d",
    cmd = "UndotreeToggle",
    keys = { { "<leader>u", "<cmd>UndotreeToggle<CR>" } },
  },

  -- 関数・クラス一覧（aerial）
  {
    "stevearc/aerial.nvim",
    commit = "645d108a5242ec7b378cbe643eb6d04d4223f034",
    keys = { { "<C-t>", "<cmd>AerialToggle<CR>", silent = true } },
    opts = {
      backends = { "lsp" },
      layout = { min_width = 28 },
    },
  },

  -- プロジェクトルート自動検出
  {
    "airblade/vim-rooter",
    commit = "51402fb77c4d6ae94994e37dc7ca13bec8f4afcc",
    event = "BufRead",
    init = function()
      vim.g.rooter_patterns = { ".git", ".git/" }
    end,
  },

  -- コードフォーマット
  { "prettier/vim-prettier", commit = "7dbdbb12c50a9f4ba72390cce2846248e4368fd0", cmd = "Prettier", ft = { "javascript", "typescript", "css", "html", "json", "markdown" } },
}
