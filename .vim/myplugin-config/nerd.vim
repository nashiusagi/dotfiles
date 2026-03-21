" nerdtree-git-plugin: ファイルのgit状態に応じて色を変える
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ 'Modified'  : '✹',
    \ 'Staged'    : '✚',
    \ 'Untracked' : '✭',
    \ 'Renamed'   : '➜',
    \ 'Unmerged'  : '═',
    \ 'Deleted'   : '✖',
    \ 'Dirty'     : '✗',
    \ 'Clean'     : '✔︎',
    \ 'Ignored'   : '☒',
    \ 'Unknown'   : '?',
    \ }
let g:NERDTreeGitStatusUseNerdFonts = 0
let g:NERDTreeGitStatusConcealBrackets = 1

" ファイル名自体をgit状態で色付け（VSCode like）
let g:NERDTreeGitStatusWithFlags = 1

" VSCodeライクな色定義
" Modified: 黄色, Untracked/Staged: 緑, Deleted: 赤, Ignored: グレー
function! s:NERDTreeHighlightGitStatus()
    highlight NERDTreeGitStatusModified   guifg=#E2C08D ctermfg=221
    highlight NERDTreeGitStatusStaged     guifg=#73C991 ctermfg=114
    highlight NERDTreeGitStatusUntracked  guifg=#73C991 ctermfg=114
    highlight NERDTreeGitStatusRenamed    guifg=#E2C08D ctermfg=221
    highlight NERDTreeGitStatusUnmerged   guifg=#F44747 ctermfg=203
    highlight NERDTreeGitStatusDeleted    guifg=#F44747 ctermfg=203
    highlight NERDTreeGitStatusDirty      guifg=#E2C08D ctermfg=221
    highlight NERDTreeGitStatusIgnored    guifg=#606060 ctermfg=241
endfunction

augroup NERDTreeGitHighlight
    au!
    autocmd VimEnter,ColorScheme * call s:NERDTreeHighlightGitStatus()
augroup END

let g:NERDTreeChDirMode=2
let g:NERDTreeIgnore=['\.rbc$', '\~$', '\.pyc$', '\.db$', '\.sqlite$', '__pycache__']
let g:NERDTreeSortOrder=['^__\.py$', '\/$', '*', '\.swp$', '\.bak$', '\~$']
let g:NERDTreeShowBookmarks=1
let g:nerdtree_tabs_focus_on_files=1
let g:NERDTreeMapOpenInTabSilent='<RightMouse>'
let g:NERDTreeWinSize=30
let NERDTreeShowHidden=1
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,.*.db,*.sqlite
nnoremap <silent><C-e> :NERDTreeToggle<CR>
"autocmd BufWritePre * :FixWhitespace

"" NERDTreeのウインドウしか開かれていないときは自動的に閉じる
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

augroup NERD
    au!
    autocmd VimEnter * NERDTree
    autocmd VimEnter * wincmd p
augroup END

"
filetype plugin indent on   " required

" To ignore plugin indent changes, instead use:
" filetype plugin on
"
" Brief help        - lists configurated plugins
" :PluginList       - lists configurated plugins
" :PluginInstall    - installs plugins; apend '!' to update or just: PluginUpdate
" :PluginSearch foo - searches for foo; append '!' to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append '!' to auto-approve removal

