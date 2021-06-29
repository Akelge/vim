"
" GVIMRC - for GUI Vim Version (gvim, MacVim)
"
" $Id$
"

if has('mac') || has('macunix')
    set guifont=Monaco:h13
    set fuoptions=maxvert,maxhorz
    set transparency=2
else
    set guifont=Monaco\ 13
endif

set anti
set lines=45 " Change in vimrc.local
set columns=90 " Change in vimrc.local
set mousefocus
set errorbells
set visualbell
set showtabline=2
set number
set guicursor=a:block-blinkon0
set showtabline=2
set background=dark
set cpoptions=+$


set guioptions-=T
set guioptions+=a
if &background == "dark"
    hi normal guibg=black
endif

colorscheme Tomorrow-Night-Eighties

" Start NERDTree and leave the cursor in it.
autocmd VimEnter * NERDTree | wincmd p
" Start NERDTree when Vim is started without file arguments.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') | NERDTree | endif
" If a file is specified, move the cursor to its window.
autocmd VimEnter * NERDTree | if argc() > 0 || exists("s:std_in") | wincmd p | endif
" Start NERDTree when Vim starts with a directory argument.
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists('s:std_in') |
    \ execute 'NERDTree' argv()[0] | wincmd p | enew | execute 'cd '.argv()[0] | endif
" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif
" Open the existing NERDTree on each new tab.
autocmd BufWinEnter * silent NERDTreeMirror
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif


" Line/block move up/down
if (has('mac') || has('macunix'))
    " set clipboard=unnamedplus
    nnoremap <M-Up> :m .-2<CR>==
    nnoremap <M-Down> :m .+1<CR>==

    inoremap <M-Up> <Esc>:m .-2<CR>==gi
    inoremap <M-Down> <Esc>:m .+1<CR>==gi

    vnoremap <M-Up> :m '<-2<CR>gv=gv
    vnoremap <M-Down> :m '>+1<CR>gv=gv
    " Select tab by Cmd-number
    nnoremap <silent> <D-1> 1gt
    nnoremap <silent> <D-2> 2gt
    nnoremap <silent> <D-3> 3gt
    nnoremap <silent> <D-4> 4gt
    nnoremap <silent> <D-5> 5gt
    nnoremap <silent> <D-6> 6gt
    nnoremap <silent> <D-7> 7gt
    nnoremap <silent> <D-8> 8gt
    nnoremap <silent> <D-9> 9gt
    nnoremap <silent> <D-0> 10gt
else
    " Select tab by Alt-number
    nnoremap <silent> <M-1> 1gt
    nnoremap <silent> <M-2> 2gt
    nnoremap <silent> <M-3> 3gt
    nnoremap <silent> <M-4> 4gt
    nnoremap <silent> <M-5> 5gt
    nnoremap <silent> <M-6> 6gt
    nnoremap <silent> <M-7> 7gt
    nnoremap <silent> <M-8> 8gt
    nnoremap <silent> <M-9> 9gt
    nnoremap <silent> <M-0> 10gt
endif


autocmd BufWritePost ~/.gvimrc   so ~/.gvimrc
autocmd BufWritePost ~/.vim/gvimrc   so ~/.vim/gvimrc

let g:terminal_ansi_colors = ['#073642', '#dc322f', 
      \ '#859900', '#b58900', '#268bd2', '#d33682',
      \ '#2aa198', '#eee8d5', '#002b36', '#cb4b16',
      \ '#93a1a1', '#839496', '#657b83', '#6c71c4',
      \ '#586e75', '#fdf6e3']

" User customizations are held in file ~/.vim/gvimrc.local
if filereadable($HOME."/.vim/gvimrc.local")
    source $HOME/.vim/gvimrc.local
endif
