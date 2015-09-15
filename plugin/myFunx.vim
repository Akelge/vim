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

function! GuiTabLabel()        
    let label = ''       
    let bufnrlist = tabpagebuflist(v:lnum)       


    " Append the tab number      
    let label .= tabpagenr().'. '        

    " Append the buffer name     
    let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])      
    if name == ''        
        " give a name to no-name documents     
        if &buftype=='quickfix'        
            let name = '[Quickfix List]'     
        else       
            let name = '[No Name]'       
        endif      
    else     
        " get only the file name       
        let name = fnamemodify(name,":t")      
    endif        
    let label .= name        

    for bufnr in bufnrlist       
        if getbufvar(bufnr, "&modified")       
            let label .= ' [+]'      
            break        
        endif      
    endfor       
    return label     
endfunction        

" set up tab tooltips with every buffer name       
function! GuiTabToolTip()      
    let tip = ''     
    let bufnrlist = tabpagebuflist(v:lnum)       

    for bufnr in bufnrlist       
        " separate buffer entries      
        if tip!=''     
            let tip .= ' | '     
        endif      

        " Add name of buffer       
        let name=bufname(bufnr)        
        if name == ''      
            " give a name to no name documents       
            if getbufvar(bufnr,'&buftype')=='quickfix'       
                let name = '[Quickfix List]'       
            else     
                let name = '[No Name]'     
            endif        
        endif      
        let tip.=name      

        " add modified/modifiable flags        
        if getbufvar(bufnr, "&modified")       
            let tip .= ' [+]'        
        endif      
        if getbufvar(bufnr, "&modifiable")==0      
            let tip .= ' [-]'        
        endif      
    endfor       

    return tip       
endfunction        

set guitablabel=%!GuiTabLabel()        
set guitabtooltip=%!GuiTabToolTip()

" vim: set ts=4 sw=4 tw=78 ft=vim : 
