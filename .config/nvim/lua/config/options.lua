-- base.vim + style.vim 相当の設定

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.wrap = true
vim.opt.linebreak = true
vim.opt.display:append("lastline")
vim.opt.virtualedit = "onemore"
vim.opt.showmatch = true
vim.opt.laststatus = 2
vim.opt.ruler = true
vim.opt.list = true
vim.opt.listchars = { tab = "▸ ", trail = "·" }

vim.opt.fileencoding = "utf-8"
vim.opt.writebackup = false
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.autoread = true
vim.opt.hidden = true
vim.opt.showcmd = true
vim.opt.pumheight = 10

vim.opt.hlsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.wildmode = "list:longest"
vim.opt.wildmenu = true

vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.smarttab = true

vim.opt.foldmethod = "marker"
vim.opt.clipboard = "unnamed"
vim.opt.mouse = "a"
vim.opt.colorcolumn = "80"

-- coc.nvim 由来の設定
vim.opt.cmdheight = 2
vim.opt.updatetime = 300
vim.opt.shortmess:append("c")
vim.opt.signcolumn = "yes"
vim.opt.timeoutlen = 500

vim.cmd("syntax enable")
vim.cmd("filetype plugin indent on")
vim.cmd("syn sync fromstart")
vim.opt.autoindent = true

-- カラースキームはプラグイン読み込み後に適用
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    vim.cmd("colorscheme molokai")
    vim.cmd("highlight Normal ctermbg=none")
    vim.cmd("highlight LineNr ctermbg=none")
  end,
})
