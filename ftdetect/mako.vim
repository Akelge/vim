" Mako
augroup mako
autocmd BufRead,BufNewFile *.mako set ft=mako
autocmd BufWinEnter *.mako set ft=mako
autocmd FileType mako set textwidth=0
augroup end
