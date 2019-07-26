" <<<< Xuyuanp/nerdtree-git-plugin
let g:NERDTreeIndicatorMapCustom = {
            \ "Modified"  : "✹",
            \ "Staged"    : "✚",
            \ "Untracked" : "✭",
            \ "Renamed"   : "➜",
            \ "Unmerged"  : "═",
            \ "Deleted"   : "✖",
            \ "Dirty"     : "✗",
            \ "Clean"     : "✔︎",
            \ 'Ignored'   : '☒',
            \ "Unknown"   : "?"}
let g:NERDTreeShowIgnoredStatus = 1
" >>>>

" <<<< airblade/vim-gitgutter
set updatetime=100
" >>>>

" <<<< flazz/vim-colorschemes
colorscheme Monokai
set guifont=Lucida_Console:h12:cANSI:qDRAFT
" >>>>

" <<<< junegunn/fzf
" Command for git grep
" - fzf#vim#grep(command, with_column, [options], [fullscreen])
command! -bang -nargs=* GGrep
            \ call fzf#vim#grep(
            \   'git grep --line-number '.shellescape(<q-args>), 0,
            \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)
" Override Colors command. You can safely do this in your .vimrc as fzf.vim
" will not override existing commands.
command! -bang Colors
            \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'}, <bang>0)
" Augmenting Ag command using fzf#vim#with_preview function
"   * fzf#vim#with_preview([[options], [preview window], [toggle keys...]])
"     * For syntax-highlighting, Ruby and any of the following tools are required:
"       - Bat: https://github.com/sharkdp/bat
"       - Highlight: http://www.andre-simon.de/doku/highlight/en/highlight.php
"       - CodeRay: http://coderay.rubychan.de/
"       - Rouge: https://github.com/jneen/rouge
"
"   :Ag  - Start fzf with hidden preview window that can be enabled with "?" key
"   :Ag! - Start fzf in fullscreen and display the preview window above
command! -bang -nargs=* Ag
            \ call fzf#vim#ag(<q-args>,
            \                 <bang>0 ? fzf#vim#with_preview('up:60%')
            \                         : fzf#vim#with_preview('right:50%:hidden', '?'),
            \                 <bang>0)
" Similarly, we can apply it to fzf#vim#grep. To use ripgrep instead of ag:
command! -bang -nargs=* Rg
            \ call fzf#vim#grep(
            \   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
            \   <bang>0 ? fzf#vim#with_preview('up:60%')
            \           : fzf#vim#with_preview('right:50%:hidden', '?'),
            \   <bang>0)
" Likewise, Files command with preview window
command! -bang -nargs=? -complete=dir Files
            \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
" >>>>

" <<<< mattn/emmet-vim
let g:user_emmet_mode='a'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" >>>>

" <<<< mbbill/undotree
nnoremap <Leader>utt :UndotreeToggle<CR>
" >>>>

" <<<< rhysd/vim-clang-format
let g:clang_format#style_options = {
            \ "ColumnLimit" : 0}
" >>>>

" <<<< scrooloose/nerdtree
let NERDTreeShowHidden=1
" >>>>

if has('nvim')
    " <<<< autozimu/LanguageClient-neovim
    let g:LanguageClient_serverCommands = { 'haskell': ['hie-wrapper'] }
    let g:LanguageClient_rootMarkers = ['*.cabal', 'stack.yaml']
    " >>>>

    " <<<< mfulz/cscope.nvim
    " Path to store the cscope files (cscope.files and cscope.out)
    " Defaults to '~/.cscope'
    let g:cscope_dir = '~/.nvim-cscope'
    " Map the default keys on startup
    " These keys are prefixed by CTRL+\ <cscope param>
    " A.e.: CTRL+\ d for goto definition of word under cursor
    " Defaults to off
    let g:cscope_map_keys = 1
    " Update the cscope files on startup of cscope.
    " Defaults to off
    let g:cscope_update_on_start = 1
    " >>>>

    " <<<< neovimhaskell/haskell-vim
    let  g:haskell_enable_quantification    =  1  "  to  enable  highlighting  of  `forall`
    let  g:haskell_enable_recursivedo       =  1  "  to  enable  highlighting  of  `mdo`      and       `rec`
    let  g:haskell_enable_arrowsyntax       =  1  "  to  enable  highlighting  of  `proc`
    let  g:haskell_enable_pattern_synonyms  =  1  "  to  enable  highlighting  of  `pattern`
    let  g:haskell_enable_typeroles         =  1  "  to  enable  highlighting  of  type       roles
    let  g:haskell_enable_static_pointers   =  1  "  to  enable  highlighting  of  `static`
    let  g:haskell_backpack                 =  1  "  to  enable  highlighting  of  backpack   keywords
    " >>>>

else
    " <<<< vim-scripts/cscope.vim
    if has('cscope')
        set cscopetag cscopeverbose
        cnoreabbrev csa cs add
        cnoreabbrev csf cs find
        cnoreabbrev csh cs help
        cnoreabbrev csk cs kill
        cnoreabbrev csr cs reset
        cnoreabbrev css cs show
    endif
    " >>>>
endif

if has('python') || has('python2') || has('python3')
    " <<<< Valloric/YouCompleteMe
    nnoremap <Leader>ycf :YcmCompleter FixIt<CR>
    nnoremap <Leader>ycg :YcmCompleter GoTo<CR>
    " nnoremap <Leader>ycgc :YcmCompleter GoToDeclaration<CR>
    " nnoremap <Leader>ycgf :YcmCompleter GoToDefinition<CR>
    " nnoremap <Leader>ycgi :YcmCompleter GoToInclude<CR>
    nnoremap <Leader>ycr :YcmRestartServer<CR>
    nnoremap <Leader>yct :YcmCompleter GetType<CR>
    if has('win32')
        let g:ycm_global_ycm_extra_conf = '~/vimfiles/ycm_extra_conf.py'
    else
        let g:ycm_global_ycm_extra_conf = '~/.vim/ycm_extra_conf.py'
    endif
    let g:ycm_autoclose_preview_window_after_insertion  =  1
    let g:ycm_confirm_extra_conf                        =  0
    let g:ycm_max_diagnostics_to_display                =  0
    let g:ycm_min_num_of_chars_for_completion           =  1
    let g:ycm_seed_identifiers_with_syntax              =  1
    " >>>>
endif

augroup plugins
    autocmd!

    " <<<< rhysd/vim-clang-format
    autocmd FileType cpp nnoremap <Leader>cf :ClangFormat<CR>
    autocmd FileType cpp xnoremap <Leader>cf :ClangFormat<CR>
    " >>>>

    " <<<< scrooloose/nerdtree
    autocmd vimenter * NERDTree
    autocmd StdinReadPre * let s:std_in=1
    autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
    " >>>>

    " <<<< autozimu/LanguageClient-neovim
    autocmd FileType haskell nnoremap <F5> :call LanguageClient_contextMenu()<CR>
    autocmd FileType haskell nnoremap <Leader>lh :call LanguageClient#textDocument_hover()<CR>
    autocmd FileType haskell nnoremap <Leader>ld :call LanguageClient#textDocument_definition()<CR>
    autocmd FileType haskell nnoremap <Leader>lr :call LanguageClient#textDocument_rename()<CR>
    autocmd FileType haskell nnoremap <Leader>lf :call LanguageClient#textDocument_formatting()<CR>
    autocmd FileType haskell nnoremap <Leader>lb :call LanguageClient#textDocument_references()<CR>
    autocmd FileType haskell nnoremap <Leader>la :call LanguageClient#textDocument_codeAction()<CR>
    autocmd FileType haskell nnoremap <Leader>ls :call LanguageClient#textDocument_documentSymbol()<CR>
    " >>>>
augroup END
