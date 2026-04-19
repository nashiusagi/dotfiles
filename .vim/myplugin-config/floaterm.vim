" vim-floaterm: フローティングターミナル

" プラグインが未インストールの場合はスキップ
if empty(globpath(&rtp, 'autoload/floaterm.vim'))
  finish
endif

" ウィンドウのサイズ・位置設定
let g:floaterm_width = 0.85
let g:floaterm_height = 0.85
let g:floaterm_position = 'center'

" フローティングターミナルをトグル
nnoremap <silent> <leader>tt :FloatermToggle<CR>
tnoremap <silent> <leader>tt <C-\><C-n>:FloatermToggle<CR>

" lazygitを起動
nnoremap <silent> <leader>g :FloatermNew --title=lazygit lazygit<CR>
