let g:jsonpath_register = '"'

augroup jsonpath
  autocmd!

  autocmd FileType json nnoremap <silent> <expr> <leader>jpe jsonpath#echo()
  autocmd FileType json nnoremap <silent> <leader>jpg :JsonPath 
  autocmd FileType json nnoremap <silent> <leader>jpp :JsonPath <C-R>"<CR>
augroup END
