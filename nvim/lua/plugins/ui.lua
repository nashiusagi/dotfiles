return {
  -- カラースキーム
  { "tomasr/molokai", commit = "c67bdfcdb31415aa0ade7f8c003261700a885476", lazy = false, priority = 1000 },

  -- ステータスライン（vim-airline → lualine）
  {
    "nvim-lualine/lualine.nvim",
    commit = "131a558e13f9f28b15cd235557150ccb23f89286",
    event = "VimEnter",
    opts = { theme = "auto" },
  },

  -- インデントガイド（indentLine → indent-blankline）
  {
    "lukas-reineke/indent-blankline.nvim",
    commit = "d28a3f70721c79e3c5f6693057ae929f3d9c0a03",
    main = "ibl",
    event = "BufRead",
    opts = {
      exclude = { filetypes = { "json", "markdown" } },
    },
  },

  -- キーバインド一覧
  {
    "liuchengxu/vim-which-key",
    commit = "72a4267b46a76f541b3e9500a7503575575d4f57",
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

  -- ヤンクのハイライト（300ms）
  {
    "machakann/vim-highlightedyank",
    commit = "285a61425e79742997bbde76a91be6189bc988fb",
    event = "VeryLazy",
    init = function()
      vim.g.highlightedyank_highlight_duration = 300
    end,
  },

  -- CSSカラープレビュー
  { "ap/vim-css-color", commit = "14fd934cdd9ca1ac0e53511094e612eb9bace373", event = "VeryLazy" },
}
