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

  -- キーバインド一覧
  {
    "liuchengxu/vim-which-key",
    event = "VeryLazy",
    config = function()
      vim.g.which_key_map = {
        t = {
          name = "Terminal / Test",
          t = "フローティングターミナルをトグル (floaterm)",
          n = "最近傍テストを実行 (vim-test)",
          f = "ファイル内テストを実行 (vim-test)",
          s = "テストスイートを実行 (vim-test)",
          l = "最後のテストを再実行 (vim-test)",
        },
        g  = "lazygitを起動 (floaterm)",
        s  = "カーソル下の単語を検索",
        b  = "バッファ一覧",
        rn = "シンボルのリネーム (LSP)",
        f  = "フォーマット (LSP)",
        a  = "コードアクション (LSP)",
        ["?"] = "キーバインド一覧",
      }
      vim.call("which_key#register", "\\", "g:which_key_map")
      vim.keymap.set("n", "<leader>", ":<C-u>WhichKey '\\'<CR>", { silent = true })
      vim.keymap.set("v", "<leader>", ":<C-u>WhichKeyVisual '\\'<CR>", { silent = true })
    end,
  },

  -- ヤンクのハイライト
  { "machakann/vim-highlightedyank", event = "BufRead" },

  -- CSSカラープレビュー
  { "ap/vim-css-color", event = "BufRead" },
}
