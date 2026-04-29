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

-- キーバインド一覧をfzfで表示
local keymaps = {
  "n   <C-p>        ファイル検索 (fzf)",
  "n   <C-f>        テキスト全体検索 (ripgrep)",
  "n   <C-e>        NERDTreeトグル",
  "n   <C-t>        Tagbarトグル",
  "n   <leader>s    カーソル下の単語をプロジェクト全体で検索",
  "n   <leader>b    バッファ一覧",
  "n   <leader>rn   シンボルのリネーム (LSP)",
  "n   <leader>f    フォーマット (LSP)",
  "n   <leader>a    コードアクション (LSP)",
  "n   <leader>ac   コードアクション（バッファ全体）(LSP)",
  "n   gd           定義へジャンプ (LSP)",
  "n   gy           型定義へジャンプ (LSP)",
  "n   gi           実装へジャンプ (LSP)",
  "n   gr           参照を表示 (LSP)",
  "n   K            ドキュメント表示 (LSP)",
  "n   <space>a     診断一覧",
  "n   <leader>tt   フローティングターミナルをトグル (floaterm)",
  "n   <leader>g    lazygitを起動 (floaterm)",
  "n   <leader>tn   最近傍テストを実行 (vim-test)",
  "n   <leader>tf   ファイル内テストを実行 (vim-test)",
  "n   <leader>ts   テストスイートを実行 (vim-test)",
  "n   <leader>tl   最後のテストを再実行 (vim-test)",
  "n   <leader>?    このキーバインド一覧を表示",
}

vim.api.nvim_create_user_command("Keymaps", function()
  vim.fn["fzf#run"](vim.fn["fzf#wrap"]({
    source = keymaps,
    options = { "--prompt", "Keymaps> ", "--no-multi" },
  }))
end, {})

map("n", "<leader>?", ":Keymaps<CR>", opts)
