return {
  -- fzf本体
  {
    "junegunn/fzf",
    commit = "6fefe025461b168eac2546ccba3403b70eb5da16",
    build = "./install --bin",
    lazy = true,
  },

  -- fzf vim統合
  {
    "junegunn/fzf.vim",
    commit = "b9624aa012ddcbae9e79964bfd30cc1fbe3cf263",
    dependencies = { { "junegunn/fzf", commit = "6fefe025461b168eac2546ccba3403b70eb5da16" } },
    event = "VeryLazy",
  },

  -- ファイルツリー
  {
    "nvim-tree/nvim-tree.lua",
    commit = "24cfcc94372e526fd9e1c2803ede9e0f1715e33f",
    dependencies = { { "nvim-tree/nvim-web-devicons", commit = "4fc505ac7bd7692824a142e96e5f529c133862f8" } },
    keys = { { "<C-e>", "<cmd>NvimTreeToggle<CR>", silent = true } },
    opts = {
      git = { enable = true },
      renderer = { highlight_git = true },
      filters = { dotfiles = false },
      view = { width = 30 },
      on_attach = function(bufnr)
        local api = require("nvim-tree.api")
        api.config.mappings.default_on_attach(bufnr)
        vim.keymap.set("n", "<C-e>", api.tree.close, { buffer = bufnr, silent = true })
      end,
    },
    init = function()
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1
    end,
  },
}
