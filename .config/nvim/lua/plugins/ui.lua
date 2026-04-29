return {
  -- カラースキーム
  { "tomasr/molokai", lazy = false, priority = 1000 },

  -- ステータスライン（vim-airline → lualine）
  {
    "nvim-lualine/lualine.nvim",
    event = "VimEnter",
    opts = { theme = "auto" },
  },

  -- インデントガイド（indentLine → indent-blankline）
  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    event = "BufRead",
    opts = {},
  },

  -- キーバインド一覧（vim-which-key → which-key.nvim）
  {
    "folke/which-key.nvim",
    event = "VeryLazy",
    opts = { delay = 500 },
    config = function(_, opts)
      local wk = require("which-key")
      wk.setup(opts)
      wk.add({
        { "<leader>t",  group = "Terminal / Test" },
        { "<leader>tt", desc = "フローティングターミナルをトグル (floaterm)" },
        { "<leader>tn", desc = "最近傍テストを実行 (vim-test)" },
        { "<leader>tf", desc = "ファイル内テストを実行 (vim-test)" },
        { "<leader>ts", desc = "テストスイートを実行 (vim-test)" },
        { "<leader>tl", desc = "最後のテストを再実行 (vim-test)" },
        { "<leader>g",  desc = "lazygitを起動 (floaterm)" },
        { "<leader>s",  desc = "カーソル下の単語を検索" },
        { "<leader>b",  desc = "バッファ一覧" },
        { "<leader>rn", desc = "シンボルのリネーム (LSP)" },
        { "<leader>f",  desc = "フォーマット (LSP)" },
        { "<leader>a",  desc = "コードアクション (LSP)" },
        { "<leader>?",  desc = "キーバインド一覧" },
      })
    end,
  },

  -- ヤンクのハイライト
  { "machakann/vim-highlightedyank", event = "BufRead" },

  -- CSSカラープレビュー
  { "ap/vim-css-color", event = "BufRead" },
}
