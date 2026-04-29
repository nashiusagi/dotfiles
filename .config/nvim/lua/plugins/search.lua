return {
  -- fzf本体
  {
    "junegunn/fzf",
    build = "./install --bin",
  },

  -- fzf vim統合
  { "junegunn/fzf.vim", dependencies = { "junegunn/fzf" } },

  -- ファイルツリー
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
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
