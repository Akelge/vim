" Append modeline after last line in buffer.
" Use substitute() (not printf()) to handle '%%s' modeline in LaTeX files.
function! AppendModeline()
  let save_cursor = getpos('.')
  let append = ' vim: set ts='.&tabstop.' sw='.&shiftwidth.' tw='.&textwidth.' ft='.&filetype.' :'
  $put =substitute(&commentstring, '%s', append, '')
  call setpos('.', save_cursor)
endfunction

" Define as a command
command! -nargs=0 -bar AppendModeline call AppendModeline()

" Map to <Leader>ml
nnoremap <silent> <Leader>ml :call AppendModeline()<CR>

" vim: set ts=4 sw=4 tw=78 ft=vim : 
