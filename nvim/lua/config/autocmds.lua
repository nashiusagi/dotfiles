local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- HTML補完
augroup("MyHTML", { clear = true })
autocmd("FileType", {
  group = "MyHTML",
  pattern = "html",
  callback = function()
    vim.keymap.set("i", "</<CR>", "</<C-x><C-o><ESC>F>a<CR><ESC>O", { buffer = true })
    vim.keymap.set("i", "</<Tab>", "</<C-x><C-o><ESC>F>a", { buffer = true })
  end,
})

-- XMLの補完
autocmd("FileType", {
  pattern = "xml",
  callback = function()
    vim.keymap.set("i", "</", "</<C-x><C-o>", { buffer = true })
  end,
})

-- フォーカスが外れたとき・バッファ離脱時に自動保存
autocmd({ "FocusLost", "BufLeave" }, {
  pattern = "*",
  command = "silent! wa",
})

-- ファイルタイプ別フォールド設定
augroup("MyFolding", { clear = true })
autocmd("FileType", {
  group = "MyFolding",
  pattern = "vim",
  callback = function()
    vim.opt_local.foldmethod = "manual"
  end,
})
autocmd("FileType", {
  group = "MyFolding",
  pattern = "*",
  callback = function()
    if vim.bo.filetype ~= "vim" then
      vim.opt_local.foldmethod = "syntax"
      vim.opt_local.foldlevel = 99
    end
  end,
})
