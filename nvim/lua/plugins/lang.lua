return {
  -- LaTeX
  { "lervag/vimtex", commit = "0f42a5130432d4af2e6fd21fb93a76915ff1f090", ft = "tex" },

  -- Markdownプレビュー
  {
    "iamcco/markdown-preview.nvim",
    commit = "a923f5fc5ba36a3b17e289dc35dc17f66d0548ee",
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
    commit = "0ab5eb8135dc884bc543a819ac7033c15e72a76b",
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
    commit = "bc0e94059de40641d163516a83c63bc45c716acf",
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
