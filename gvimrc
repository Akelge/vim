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
set guicursor=a:block-blinkon0
set showtabline=2
set guitablabel=%!GuiTabLabel()
set guitabtooltip=%!GuiTabToolTip()
set background=dark
set cpoptions=+$


set guioptions-=T
set guioptions+=a
if &background == "dark"
    hi normal guibg=black
endif

colorscheme Tomorrow-Night-Eighties

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

" User customizations are held in file ~/.vim/gvimrc.local
if filereadable($HOME."/.vim/gvimrc.local")
    source $HOME/.vim/gvimrc.local
endif
