"
" GVIMRC - for GUI Vim Version (gvim, MacVim)
"
" $Id$
"

if has('mac') || has('macunix')
    set guifont=Monaco:h11
    set fuoptions=maxvert,maxhorz
    set transparency=4
else
    set guifont=Monaco\ 11
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
" colorscheme railscasts
" colorscheme zenburn
" colorscheme freya
" colorscheme southwest-fog
" colorscheme moria
" colorscheme morning
" colorscheme desert
" colorscheme macvim
" colorscheme inkpot

" Line/block move up/down
if (has('mac') || has('macunix'))
    " set clipboard=unnamedplus
    nnoremap <M-Up> :m .-2<CR>==
    nnoremap <M-Down> :m .+1<CR>==

    inoremap <M-Up> <Esc>:m .-2<CR>==gi
    inoremap <M-Down> <Esc>:m .+1<CR>==gi

    vnoremap <M-Up> :m '<-2<CR>gv=gv
    vnoremap <M-Down> :m '>+1<CR>gv=gv
endif

" Emacs like indenting. Pressing Tab indents line
set indentkeys=0{,0},0),:,0#,!^F,o,O,e,!<Tab>,!^F
set cinkeys=0{,0},0),:,0#,!^F,o,O,e,!<Tab>,!^F



" User customizations are held in file ~/.vim/gvimrc.local
if filereadable($HOME."/.vim/gvimrc.local")
    source $HOME/.vim/gvimrc.local
endif
