" fzf.vim: ファジーファイル検索（VSCode Ctrl+P like）

" Ctrl+P でファイル検索
nnoremap <C-p> :Files<CR>

" Ctrl+F でファイル内テキスト検索（grep）
nnoremap <C-f> :Rg<CR>

" カーソル下の単語をプロジェクト全体で検索
nnoremap <leader>s :Rg <C-R><C-W><CR>

" バッファ一覧
nnoremap <leader>b :Buffers<CR>
