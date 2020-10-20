augroup clang_format
  autocmd!

  autocmd FileType cpp nnoremap <Leader>cf :ClangFormat<CR>
  autocmd FileType cpp xnoremap <Leader>cf :ClangFormat<CR>
augroup END
