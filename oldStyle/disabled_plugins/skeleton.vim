" Copyright by Andrea Mistrali <am@am.cx>
" First version: Who knows?
" Last modified: 2009-04-28T17:26 CEST (+0200)
"
" Synopsis: Templating system for vim
" 
" Remember to define in your vimrc the following var
" let g:fullname = 'Your Full Name'
" let g:email = 'your.email@address'
"
" Skeleton files could contain (in the first 20 lines) the following
" 'vars':
"   @@LONGNAME@@ - replaced by g:fullname
"   @@EMAIL@@    - replaced by g:email
"   @@DESCR@@    - Synopsis of file (asked by this plugin)
"   @@crdate@@   - replaced by creation date

" Define template directory
let g:skeletons = '~/.vim/templates'
let s:timeFormat= "%FT%H:%M %Z (%z)"

" Preserve template files
augroup newfiles
  " First we load templates for the file type
  autocmd BufNewFile  *	ks|call OpenFile()|'s

  " Update of "Last Modified" date on writing
  " autocmd BufWritePre,FileWritePre *   ks|call LastMod()|'s

  " Protect templates and plugin, removing write commands
  autocmd BufRead,BufNewFile ~/.vim/templates/* au! newfiles
  autocmd BufRead,BufNewFile */skeleton.vim au! newfiles
  autocmd BufWritePre,FileWritePre */skeleton.vim au! newfiles
augroup END


" Function to modify "Last Modified" date. Works on first N lines
function! LastMod()
  if line("$") > 20
    let l = 20
  else
    let l = line("$")
  endif
  execute "1," . l . "s/Last modified: .*/Last modified: " .
        \ strftime(s:timeFormat) . "/e"
endfunction

" Function to open a file and set some defaults
function! OpenFile()
  let s:filename=expand("<afile>")
  let l:ext=fnamemodify(s:filename, ":e")
  let l:skel = g:skeletons."/skeleton.".l:ext
  if filereadable(fnamemodify(l:skel,":p"))
      let s:doit=input("Perform auto insert (y/n)? ")
      if s:doit == 'n' || s:doit == 'N'
          return
      endif
      execute "0r" l:skel
      let s:syn=input("Synopsis: ")
      if line("$") > 20
          let l = 20
      else
          let l = line("$")
      endif
      execute "1," . l . "s/@@DESCR@@/" .
                  \ s:syn
      execute "1," . l . "s/@@crdate@@/" .
                  \ strftime(s:timeFormat) . "/e"
      execute "1," . l . "s/@@LONGNAME@@/" .
                  \ g:fullname . "/e"
      execute "1," . l . "s/@@EMAIL@@/" .
                  \ g:email . "/e"
  endif
endfunction

