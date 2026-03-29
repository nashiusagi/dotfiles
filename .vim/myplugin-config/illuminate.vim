" vim-illuminate: カーソル下の識別子を自動ハイライト

" ハイライトまでの遅延時間 (ms)
let g:Illuminate_delay = 250

" coc.nvim のLSPハイライトを優先するため、illuminate のハイライトを無効化しない
" (両方有効にすることで補完として機能する)

" 特定のファイルタイプではハイライトを無効化
let g:Illuminate_ftblacklist = ['NERDTree', 'tagbar', 'fzf']
