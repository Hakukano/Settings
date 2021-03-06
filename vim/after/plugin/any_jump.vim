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
