return {
  -- LaTeX
  { "lervag/vimtex", ft = "tex" },

  -- Markdownプレビュー
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
    ft = "markdown",
    build = "cd app && npm install",
    init = function()
      vim.g.mkdp_auto_start = 0
      vim.g.mkdp_auto_close = 1
      vim.g.mkdp_preview_options = { mermaid = {} }
    end,
  },

  -- フローティングターミナル
  {
    "voldikss/vim-floaterm",
    cmd = { "FloatermNew", "FloatermToggle" },
    keys = {
      { "<leader>tt", "<cmd>FloatermToggle<CR>", mode = { "n", "t" }, silent = true },
      { "<leader>g",  "<cmd>FloatermNew --title=lazygit lazygit<CR>", silent = true },
    },
    init = function()
      vim.g.floaterm_width = 0.85
      vim.g.floaterm_height = 0.85
      vim.g.floaterm_position = "center"
    end,
  },

  -- テストランナー
  {
    "vim-test/vim-test",
    cmd = { "TestNearest", "TestFile", "TestSuite", "TestLast" },
    keys = {
      { "<leader>tn", ":TestNearest<CR>", silent = true },
      { "<leader>tf", ":TestFile<CR>",    silent = true },
      { "<leader>ts", ":TestSuite<CR>",   silent = true },
      { "<leader>tl", ":TestLast<CR>",    silent = true },
    },
    init = function()
      vim.g["test#strategy"] = "floaterm"
    end,
  },
}
