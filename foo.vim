function! s:Tmpedit()
    tcd $Tmp
    e tmp.vim
endfunction
command Tmpedit call s:Tmpedit()
