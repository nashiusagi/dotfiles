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
  },
}
