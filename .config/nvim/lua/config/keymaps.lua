local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- 行番号トグル
map("n", "<leader>ln", ":set relativenumber!<CR>", opts)

-- fzf
vim.env.FZF_DEFAULT_COMMAND = "fdfind --type f --hidden --follow --exclude .git"
map("n", "<C-p>", ":Files<CR>", opts)
map("n", "<C-f>", ":Rg<CR>", opts)
map("n", "<leader>s", ":Rg <C-R><C-W><CR>", opts)
map("n", "<leader>b", ":Buffers<CR>", opts)

-- floaterm
map("n", "<leader>tt", ":FloatermToggle<CR>", opts)
map("t", "<leader>tt", "<C-\\><C-n>:FloatermToggle<CR>", opts)
map("n", "<leader>g", ":FloatermNew --title=lazygit lazygit<CR>", opts)

-- LSP（nvim-lspconfig）
map("n", "gd", vim.lsp.buf.definition, opts)
map("n", "gy", vim.lsp.buf.type_definition, opts)
map("n", "gi", vim.lsp.buf.implementation, opts)
map("n", "gr", vim.lsp.buf.references, opts)
map("n", "K", vim.lsp.buf.hover, opts)
map("n", "<leader>rn", vim.lsp.buf.rename, opts)
map("n", "<leader>f", vim.lsp.buf.format, opts)
map("n", "<leader>a", vim.lsp.buf.code_action, opts)
map("n", "<leader>ac", vim.lsp.buf.code_action, opts)
map("n", "[g", vim.diagnostic.goto_prev, opts)
map("n", "]g", vim.diagnostic.goto_next, opts)
map("n", "<space>a", vim.diagnostic.setloclist, opts)
