" vim-which-key: リーダーキー押下時にキーバインド一覧をポップアップ表示

" プラグインが未インストールの場合はスキップ
if empty(globpath(&rtp, 'autoload/which_key.vim'))
  finish
endif

" ポップアップ表示の遅延（ms）
set timeoutlen=500

" --- <leader> キーマップ定義 ---
let g:which_key_map = {}

let g:which_key_map['t'] = 'フローティングターミナルをトグル (floaterm)'
let g:which_key_map['g'] = 'lazygitを起動 (floaterm)'
let g:which_key_map['s'] = 'カーソル下の単語を検索'
let g:which_key_map['b'] = 'バッファ一覧'
let g:which_key_map['r'] = { 'name': 'Rename' }
let g:which_key_map['r']['n'] = 'シンボルのリネーム (coc)'
let g:which_key_map['f'] = 'フォーマット (coc)'
let g:which_key_map['a'] = 'コードアクション (coc)'
let g:which_key_map['q'] = { 'name': 'Quick Fix' }
let g:which_key_map['q']['f'] = 'クイックフィックス (coc)'

call which_key#register('\', "g:which_key_map")

nnoremap <silent> <leader> :<c-u>WhichKey '\'<CR>
vnoremap <silent> <leader> :<c-u>WhichKeyVisual '\'<CR>

" --- <space> キーマップ定義 ---
let g:which_key_space_map = {}

let g:which_key_space_map['a'] = '診断一覧 (coc)'
let g:which_key_space_map['e'] = '拡張機能一覧 (coc)'
let g:which_key_space_map['c'] = 'コマンド一覧 (coc)'
let g:which_key_space_map['o'] = 'アウトライン (coc)'
let g:which_key_space_map['s'] = 'シンボル一覧 (coc)'
let g:which_key_space_map['j'] = '次の診断へ (coc)'
let g:which_key_space_map['k'] = '前の診断へ (coc)'
let g:which_key_space_map['p'] = 'CocListを再開'

call which_key#register('<Space>', "g:which_key_space_map")

nnoremap <silent> <space> :<c-u>WhichKey '<Space>'<CR>
vnoremap <silent> <space> :<c-u>WhichKeyVisual '<Space>'<CR>

" --- fzfで日本語説明付きキーバインド一覧を表示 ---
let s:keymaps = [
  \ 'n   <C-p>        ファイル検索 (fzf)',
  \ 'n   <C-f>        テキスト全体検索 (ripgrep)',
  \ 'n   <C-e>        NERDTreeトグル',
  \ 'n   <C-t>        Tagbarトグル',
  \ 'n   <leader>s    カーソル下の単語をプロジェクト全体で検索',
  \ 'n   <leader>b    バッファ一覧',
  \ 'n   <leader>rn   シンボルのリネーム (coc)',
  \ 'n   <leader>f    フォーマット (coc)',
  \ 'n   <leader>a    コードアクション (coc)',
  \ 'n   <leader>ac   コードアクション（バッファ全体）(coc)',
  \ 'n   <leader>qf   クイックフィックス (coc)',
  \ 'n   gd           定義へジャンプ (coc)',
  \ 'n   gy           型定義へジャンプ (coc)',
  \ 'n   gi           実装へジャンプ (coc)',
  \ 'n   gr           参照を表示 (coc)',
  \ 'n   K            ドキュメント表示 (coc)',
  \ 'n   <space>a     診断一覧 (coc)',
  \ 'n   <space>e     拡張機能一覧 (coc)',
  \ 'n   <space>c     コマンド一覧 (coc)',
  \ 'n   <space>o     アウトライン (coc)',
  \ 'n   <space>s     シンボル一覧 (coc)',
  \ 'n   <space>j     次の診断へ (coc)',
  \ 'n   <space>k     前の診断へ (coc)',
  \ 'n   <space>p     CocListを再開',
  \ 'n   <leader>t    フローティングターミナルをトグル (floaterm)',
  \ 'n   <leader>g    lazygitを起動 (floaterm)',
  \ 'n   <leader>?    このキーバインド一覧を表示',
  \ ]

function! s:show_keymaps()
  call fzf#run(fzf#wrap({
    \ 'source': s:keymaps,
    \ 'options': ['--prompt', 'Keymaps> ', '--no-multi'],
    \ }))
endfunction

command! Keymaps call s:show_keymaps()
nnoremap <silent> <leader>? :Keymaps<CR>
