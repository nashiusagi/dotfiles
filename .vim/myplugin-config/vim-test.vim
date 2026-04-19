" vim-test: Vim内からテストを実行

" プラグインが未インストールの場合はスキップ
if empty(globpath(&rtp, 'autoload/test.vim')) && !exists('g:loaded_test')
  finish
endif

" vim-floatermと連携
let g:test#strategy = 'floaterm'

nmap <silent> <leader>tn :TestNearest<CR>
nmap <silent> <leader>tf :TestFile<CR>
nmap <silent> <leader>ts :TestSuite<CR>
nmap <silent> <leader>tl :TestLast<CR>
