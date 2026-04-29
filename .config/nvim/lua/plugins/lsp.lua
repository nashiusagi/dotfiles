return {
  -- LSPサーバー管理
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    opts = {},
  },

  -- 補完エンジン
  {
    "hrsh7th/nvim-cmp",
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
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

  -- LSP設定（native LSP + mason）
  {
    "hrsh7th/cmp-nvim-lsp",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local bin = vim.fn.stdpath("data") .. "/mason/bin/"

      -- mason経由でインストールしたサーバーをネイティブLSPで起動するヘルパー
      -- 新しいサーバーを追加するときは servers テーブルに追加するだけでよい
      local servers = {
        {
          name = "pyright",
          cmd = { bin .. "pyright-langserver", "--stdio" },
          filetypes = { "python" },
          root_markers = { "pyproject.toml", "setup.py", "setup.cfg", ".git" },
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
        },
        {
          name = "gopls",
          cmd = { bin .. "gopls" },
          filetypes = { "go", "gomod", "gowork", "gotmpl" },
          root_markers = { "go.work", "go.mod", ".git" },
        },
      }

      for _, server in ipairs(servers) do
        local cfg = vim.tbl_extend("force", { capabilities = capabilities }, server)
        local name = cfg.name
        cfg.name = nil
        vim.lsp.config(name, cfg)
        vim.lsp.enable(name)
      end

      -- カーソル停止時に識別子をハイライト
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local bufnr = args.buf
          vim.api.nvim_create_autocmd("CursorHold", {
            buffer = bufnr,
            callback = function() vim.lsp.buf.document_highlight() end,
          })
          vim.api.nvim_create_autocmd("CursorMoved", {
            buffer = bufnr,
            callback = function() vim.lsp.buf.clear_references() end,
          })
        end,
      })
    end,
  },
}
