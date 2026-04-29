return {
  -- Git操作
  { "tpope/vim-fugitive", cmd = { "Git", "G" } },

  -- Git差分をガターに表示（vim-gitgutter → gitsigns.nvim）
  {
    "lewis6991/gitsigns.nvim",
    event = "BufRead",
    opts = {
      signs = {
        add          = { text = "+" },
        change       = { text = "~" },
        delete       = { text = "_" },
        topdelete    = { text = "‾" },
        changedelete = { text = "~" },
      },
    },
    config = function(_, opts)
      require("gitsigns").setup(opts)
      -- VSCodeライクな色定義
      vim.api.nvim_set_hl(0, "GitSignsAdd",    { fg = "#73C991" })
      vim.api.nvim_set_hl(0, "GitSignsChange", { fg = "#E2C08D" })
      vim.api.nvim_set_hl(0, "GitSignsDelete", { fg = "#F44747" })
    end,
  },
}
