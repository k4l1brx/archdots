set nowrap

nnoremap <F5> :! pandoc -s -o %<.pdf % <CR>
nnoremap <F6> :! zathura %<.pdf & <CR>
