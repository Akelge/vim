"
" General Setup
"
" $Id$
"
" First of all determine the OS we are on
" Can be Linux or Darwin
set nocompatible                " Use Vim defaults (much better!)
set backspace=indent,eol,start  " allow backspacing over everything
set textwidth=0                 " Textwidth 0 usually, we set it to 79 later
set backup
set viminfo='20,\"50,f10,!,%
set history=50
set nohlsearch
set nostartofline
set autochdir
set nopaste

set nofoldenable
" set background=dark
set title
" set number

set browsedir=buffer
set autochdir
set cpoptions=aAcF$
set modeline
set modelines=1
set encoding=utf-8
set listchars=tab:->,trail:.,eol:$,extends:>,precedes:<
set ignorecase      " Do case insensitive matching
set smartcase       " But with style
set errorbells
set showcmd         " Show (partial) command in status line.
set showmatch       " Show matching brackets.
set incsearch       " Incremental search
set autowrite       " Automatically save before commands like :next and :make
set backupcopy=yes
set fileformats=unix,mac,dos
set fileformat=unix
set mouse=a

" let g:loaded_matchparen=1

" We use , as leader
let g:mapleader = ","

" Let's go to 256 colors
set t_Co=256
set ruler
set cmdheight=1
set laststatus=2
"
" Emacs like indenting. Pressing Tab indents line
" Not in python, there it is managed by GetPythonIndent
set indentkeys=0{,0},0),:,0#,!^F,o,O,e,!<Tab>,!^F
set cinkeys=0{,0},0),:,0#,!^F,o,O,e,!<Tab>,!^F

" Suffixes that get lower priority when doing tab completion for filenames.
" These are files we are not likely to want to edit or read.
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.idx,.db,.out,.toc,.pyc,pyo

" PYTHON GOODIES
set tabstop=2
set shiftwidth=2
set smarttab
set expandtab
set softtabstop=2

" Highlightin in python:
let python_highlight_numbers = 1
let python_highlight_builtins = 1
let python_highlight_exceptions = 1
let python_highlight_space_errors = 1

" Flake8
let g:PyFlakeCheckers = 'pep8,frosted'
let g:PyFlakeDisabledMessages = 'E128,E501,E116'
nnoremap <silent> <Leader>8 :PyFlakeToggle<CR>

" END PYTHON GOODIES

if has('mac') || has('macunix')
    set printfont=Monaco:h12
else
    set printfont=Monaco\ 12
endif


""""""""""
" NERDTree
""""""""""
let NERDTreeIgnore = ['\.vim$', '\~$', '\.pyc']
let NERDTreeShowBookmarks = 1
let g:NERDTreeGitStatusUseNerdFonts = 1
let g:NERDTreeGitStatusShowClean = 0
let g:NERDTreeCustomOpenArgs={'file':{'where': 't'}}

nnoremap <silent> <Leader>N :NERDTreeToggle<CR>
nnoremap <silent> <Leader>n :NERDTreeFocus<CR>


""""""""""""""""
" NERD Commenter
""""""""""""""""
let NERDSpaceDelims=1
let NERDCreateDefaultMappings=1

"""""""""""""""""""
" Templates
"""""""""""""""""""
let g:templates_directory=[$HOME.'/.vim/templates', 'templates']

"""""""""""""""
" Terminal
"""""""""""""""
set termwinsize=10*0
nnoremap <silent> <Leader>tt :below terminal<CR>

"""""""""""""""
" GIT
"""""""""""""""
nnoremap <silent> <Leader>gh :GitGutterLineHighlightsToggle<CR>
nnoremap <silent> <Leader>gc :Git commit -a<CR>
nnoremap <silent> <Leader>gs :Git<CR>
nnoremap <silent> <Leader>ga :Git add -p<CR>
nnoremap <silent> <Leader>gm :Git commit --amend<CR>
nnoremap <silent> <Leader>gp :Git pull<CR>
nnoremap <silent> <Leader>gP :Git push<CR>

""""""""""""""""""
" Airline customizations
""""""""""""""""""
let g:airline#extensions#capslock#enabled = 1
let g:airline#extensions#branch#use_vcscommand = 0

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols.linenr = '㏑'
let g:airline_symbols.colnr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = '✘'
" let g:airline_symbols.whitespace = 'Ξ'
let g:airline#extensions#whitespace#show_message = 0

"""""""""""
" Sessions
"""""""""""
set sessionoptions-=buffers
set sessionoptions-=options
let g:session_lock_enabled = 0
let g:session_autoload = 0
let g:session_autosave = 'yes'
let g:session_autosave_periodic = 10


""""""""""""
" Keymappings
""""""""""""
nnoremap <silent> <Leader>l :set list!<CR>
nnoremap <silent> <Leader>f :set fullscreen!<CR>
nnoremap <silent> <Leader>x :set paste!<CR>

nnoremap <silent> da "_dd

" diffput/diffget
nnoremap <silent> <Leader>dp :diffput<CR>
nnoremap <silent> <Leader>dg :diffget<CR>

" Line/block move up/down
if (has('mac') || has('macunix'))
    nnoremap <T-Down> :m .+1<CR>==
    nnoremap <T-Up> :m .-2<CR>==

    inoremap <T-Down> <Esc>:m .+1<CR>==gi
    inoremap <T-Up> <Esc>:m .-2<CR>==gi

    vnoremap <T-Down> :m '>+0<CR>gv=gv
    vnoremap <T-Up> :m '<-2<CR>gv=gv
else
    nnoremap <C-Down> :m .+1<CR>==
    nnoremap <C-Up> :m .-2<CR>==

    inoremap <C-Down> <Esc>:m .+1<CR>==gi
    inoremap <C-Up> <Esc>:m .-2<CR>==gi

    vnoremap <C-Down> :m '>+0<CR>gv=gv
    vnoremap <C-Up> :m '<-2<CR>gv=gv
endif

" Visual mode selection
nnoremap <silent> <S-Down> V
nnoremap <silent> <S-Up> V
vnoremap <silent> <S-Down> j
vnoremap <silent> <S-Up> k

" Map Ctrl-T to new tab and Ctrl-W to close tab
" Map Ctrl-S to save
if !(has('mac') || has('macunix'))
    set clipboard=unnamed
    nnoremap <silent> <C-T> :tabnew<CR>
    nnoremap <silent> <C-W> :tabclose<CR>
    nnoremap <silent> <C-S> :w<CR>
endif

" <Leader>hh opens my help file
" nnoremap <silent> <Leader>hh :help akmap<CR>

if has("syntax")
    syntax on
endif

if has("autocmd")
  filetype plugin indent on
  " When editing a file, always jump to the last cursor position
  autocmd BufReadPost *
        \ if line("'\"") > 0 && line ("'\"") <= line("$") |
        \   exe "normal g'\"" |
        \ endif
  " If doing a diff. Upon writing changes to file, automatically update the differences
  autocmd BufWritePost * if &diff == 1 | diffupdate | endif

  " Text files settings
  autocmd BufNewFile,BufRead *.txt setf text
  autocmd FileType text set textwidth=78 printfont=:h10

  " Reload .vimrc, after modifications
  autocmd BufWritePost ~/.vimrc       so ~/.vimrc
  autocmd BufWritePost ~/.vim/vimrc   so ~/.vim/vimrc
  if has("gui_running")
      if filereadable($HOME."/.gvimrc")
          source ~/.gvimrc
      endif
      if filereadable($HOME."/.vim/gvimrc")
          source ~/.vim/gvimrc
      endif
  endif

endif

""" iTerm 2 Custom cursor shape
if $TERM_PROGRAM == 'iTerm.app'
    let &t_SI = "\<Esc>]50;CursorShape=1\x7"
    let &t_EI = "\<Esc>]50;CursorShape=0\x7"

    let &t_ti = &t_ti . "\e[?2004h"
    let &t_te = "\e[?2004l" . &t_te
    function! XTermPasteBegin(ret)
        set pastetoggle=<Esc>[201~
        set paste
        return a:ret
    endfunction
    map <expr> <Esc>[200~ XTermPasteBegin("i")
    imap <expr> <Esc>[200~ XTermPasteBegin("")
endif

" colorscheme freya

" User customizations are held in file ~/.vim/vimrc.local
if filereadable($HOME."/.vim/vimrc.local")
    source $HOME/.vim/vimrc.local
endif

" vim: set ts=4 sw=4 tw=78 ft=vim :
