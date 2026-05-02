return {
  -- LSPサーバー管理
  {
    "williamboman/mason.nvim",
    commit = "cb8445f8ce85d957416c106b780efd51c6298f89",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
  },

  -- mason-lspconfig: インストール済みサーバーを自動で vim.lsp.enable する
  -- nvim-lspconfig: 各サーバーのデフォルト設定（cmd, filetypes等）を提供
  -- 新しいサーバーを追加するときは ensure_installed に名前を追加するだけでよい
  {
    "williamboman/mason-lspconfig.nvim",
    commit = "0c2823e0418f3d9230ff8b201c976e84de1cb401",
    dependencies = {
      { "williamboman/mason.nvim", commit = "cb8445f8ce85d957416c106b780efd51c6298f89" },
      { "neovim/nvim-lspconfig", commit = "6419b36f50c42420cbbf1d3ffba573094cf414c8" },
      { "hrsh7th/cmp-nvim-lsp", commit = "cbc7b02bb99fae35cb42f514762b89b5126651ef" },
    },
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      -- サーバー固有の設定（cmd は nvim-lspconfig が自動解決するため不要）
      vim.lsp.config("pyright", {
        capabilities = capabilities,
        settings = {
          python = {
            analysis = {
              autoImportCompletions = true,
              typeCheckingMode = "basic",
            },
          },
          pyright = {
            inlayHints = { variableTypes = false, functionReturnTypes = false },
          },
        },
      })

      vim.lsp.config("gopls", {
        capabilities = capabilities,
      })

      vim.lsp.config("ts_ls", {
        capabilities = capabilities,
        filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue" },
      })

      require("mason-lspconfig").setup({
        ensure_installed = { "pyright", "gopls", "vue_ls", "ts_ls" },
        automatic_enable = true,
      })

    end,
  },

  -- 補完エンジン
  {
    "hrsh7th/nvim-cmp",
    commit = "a1d504892f2bc56c2e79b65c6faded2fd21f3eca",
    event = "InsertEnter",
    dependencies = {
      { "hrsh7th/cmp-nvim-lsp", commit = "cbc7b02bb99fae35cb42f514762b89b5126651ef" },
      { "hrsh7th/cmp-buffer", commit = "b74fab3656eea9de20a9b8116afa3cfc4ec09657" },
      { "hrsh7th/cmp-path", commit = "c642487086dbd9a93160e1679a1327be111cbc25" },
      { "L3MON4D3/LuaSnip", commit = "a62e1083a3cfe8b6b206e7d3d33a51091df25357" },
      { "saadparwaiz1/cmp_luasnip", commit = "98d9cb5c2c38532bd9bdb481067b20fea8f32e90" },
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert({
          ["<TAB>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.confirm({ select = true })
            elseif luasnip.expand_or_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<S-TAB>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            else
              fallback()
            end
          end, { "i", "s" }),
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"]      = cmp.mapping.confirm({ select = false }),
          ["<C-b>"]     = cmp.mapping.scroll_docs(-4),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
        }, {
          { name = "buffer" },
          { name = "path" },
        }),
      })
    end,
  },
}
