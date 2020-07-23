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
colorscheme gruvbox
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

nnoremap <Leader>fa :Ag<CR>
nnoremap <Leader>fr :Rg<CR>
nnoremap <Leader>ff :FZF<CR>
" >>>>

" <<<< mattn/emmet-vim
let g:user_emmet_mode='a'
let g:user_emmet_install_global = 0
autocmd FileType html,css EmmetInstall
" >>>>

" <<<< mbbill/undotree
nnoremap <Leader>utt :UndotreeToggle<CR>
" >>>>

" <<<< mogelbrod/vim-jsonpath
let g:jsonpath_register = '"'
" >>>>

" <<<< octol/vim-cpp-enhanced-highlight
let  g:cpp_class_decl_highlight       =  1
let  g:cpp_class_scope_highlight      =  0
let  g:cpp_concepts_highlight         =  1
let  g:cpp_member_variable_highlight  =  1
" >>>>

" <<<< pechorin/any-jump.vim
let g:any_jump_disable_default_keybindings = 1
nnoremap <leader>aj :AnyJump<CR>

" Show line numbers in search rusults
let g:any_jump_list_numbers = 0

" Auto search references
let g:any_jump_references_enabled = 1

" Auto group results by filename
let g:any_jump_grouping_enabled = 1

" Amount of preview lines for each search result
let g:any_jump_preview_lines_count = 5

" Max search results, other results can be opened via [a]
let g:any_jump_max_search_results = 7

" Prefered search engine: rg or ag
let g:any_jump_search_prefered_engine = 'rg'

" Search results list styles:
" - 'filename_first'
" - 'filename_last'
let g:any_jump_results_ui_style = 'filename_first'

" Any-jump window size & position options
let g:any_jump_window_width_ratio  = 0.6
let g:any_jump_window_height_ratio = 0.6
let g:any_jump_window_top_offset   = 4

" Remove comments line from search results (default: 1)
let g:any_jump_remove_comments_from_results = 1

" Cursor keyword selection mode
"
" on line:
"
" "MyNamespace::MyClass"
"                  ^
" then cursor is on MyClass word
"
" 'word' - will match 'MyClass'
" 'full' - will match 'MyNamespace::MyClass'

let g:any_jump_keyword_match_cursor_mode = 'word'
" >>>>

" <<<< rhysd/vim-clang-format
" let g:clang_format#style_options = {
"       \ 'ColumnLimit' : 0}
" >>>>

" <<<< scrooloose/nerdtree
let NERDTreeShowHidden=1
nnoremap <Leader>ntf :NERDTreeFocus<CR>
" >>>>

if has('nvim')
  " <<<< alx741/vim-hindent
  let g:hindent_on_save = 1
  " >>>>

  " <<<< iamcco/markdown-preview.nvim
  " set to 1, nvim will open the preview window after entering the markdown buffer
  " default: 0
  let g:mkdp_auto_start = 0
  " set to 1, the nvim will auto close current preview window when change
  " from markdown buffer to another buffer
  " default: 1
  let g:mkdp_auto_close = 1
  " set to 1, the vim will refresh markdown when save the buffer or
  " leave from insert mode, default 0 is auto refresh markdown as you edit or
  " move the cursor
  " default: 0
  let g:mkdp_refresh_slow = 0
  " set to 1, the MarkdownPreview command can be use for all files,
  " by default it can be use in markdown file
  " default: 0
  let g:mkdp_command_for_global = 0
  " set to 1, preview server available to others in your network
  " by default, the server listens on localhost (127.0.0.1)
  " default: 0
  let g:mkdp_open_to_the_world = 0
  " use custom IP to open preview page
  " useful when you work in remote vim and preview on local browser
  " more detail see: https://github.com/iamcco/markdown-preview.nvim/pull/9
  " default empty
  let g:mkdp_open_ip = ''
  " specify browser to open preview page
  " default: ''
  let g:mkdp_browser = ''
  " set to 1, echo preview page url in command line when open preview page
  " default is 0
  let g:mkdp_echo_preview_url = 0
  " a custom vim function name to open preview page
  " this function will receive url as param
  " default is empty
  let g:mkdp_browserfunc = ''
  " options for markdown render
  " mkit: markdown-it options for render
  " katex: katex options for math
  " uml: markdown-it-plantuml options
  " maid: mermaid options
  " disable_sync_scroll: if disable sync scroll, default 0
  " sync_scroll_type: 'middle', 'top' or 'relative', default value is 'middle'
  "   middle: mean the cursor position alway show at the middle of the preview page
  "   top: mean the vim top viewport alway show at the top of the preview page
  "   relative: mean the cursor position alway show at the relative positon of the preview page
  " hide_yaml_meta: if hide yaml metadata, default is 1
  " sequence_diagrams: js-sequence-diagrams options
  let g:mkdp_preview_options = {
        \ 'mkit': {},
        \ 'katex': {},
        \ 'uml': {},
        \ 'maid': {},
        \ 'disable_sync_scroll': 0,
        \ 'sync_scroll_type': 'middle',
        \ 'hide_yaml_meta': 1,
        \ 'sequence_diagrams': {}
        \ }
  " use a custom markdown style must be absolute path
  let g:mkdp_markdown_css = ''
  " use a custom highlight style must absolute path
  let g:mkdp_highlight_css = ''
  " use a custom port to start server or random for empty
  let g:mkdp_port = ''
  " preview page title
  " ${name} will be replace with the file name
  let g:mkdp_page_title = '「${name}」'
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

  " <<<< mogelbrod/vim-jsonpath
  autocmd FileType json nnoremap <silent> <expr> <leader>jpe jsonpath#echo()
  autocmd FileType json nnoremap <silent> <leader>jpg :JsonPath 
  autocmd FileType json nnoremap <silent> <leader>jpp :JsonPath <C-R>"<CR>
  " >>>>

  " <<<< rhysd/vim-clang-format
  autocmd FileType cpp nnoremap <Leader>cf :ClangFormat<CR>
  autocmd FileType cpp xnoremap <Leader>cf :ClangFormat<CR>
  " >>>>

  " <<<< rust-lang/rust.vim
  autocmd FileType rust nnoremap <Leader>rf :RustFmt<CR>
  " >>>>

  " <<<< scrooloose/nerdtree
  autocmd vimenter * NERDTree
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
  " >>>>

augroup END
