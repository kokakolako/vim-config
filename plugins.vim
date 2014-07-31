" Airline (lightweight powerline alternative)
" --------------------------------------------------------

" Use powerline fonts
let g:airline_powerline_fonts = 1

" Use a nice airline theme
let g:airline_theme = "hemisu_airline"

" Enable some extensions
" let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#whitespace#enabled = 1

" Configure the whitespace extension
let g:airline#extensions#whitespace#checks = [ "indent", "trailing" ]
let g:airline#extensions#whitespace#show_message = 1

" Theming the seperators ( airline + tabline )
let g:airline_left_sep = " "
let g:airline_right_sep = " "
let g:airline_left_alt_sep = "|"
let g:airline_right_alt_sep = "|"
" let g:airline#extensions#tabline#left_sep = " "
" let g:airline#extensions#tabline#right_sep = "  "
" let g:airline#extensions#tabline#right_alt_sep = "|"
" let g:airline#extensions#tabline#left_alt_sep = "|"

" Enabling Tagbar
let g:airline#extensions#tagbar#enabled = 1

" CtrlSpace
" --------------------------------------------------------

" Let CtrlSpace display it own styles
let g:airline_exclude_preview = 1
let g:ctrlspace_use_tabline = 1

" autocmd BufNewFile __CS__ set statusline=0
" let g:ctrlspace_statusline=0

" Neocomplete (Autocompletion in vim)
" --------------------------------------------------------

let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#enable_auto_delimiter = 1
let g:neocomplete#max_list = 15
let g:neocomplete#force_overwrite_completefunc = 1

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
    let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  "return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr> <TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr> <C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr> <BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr> <C-y>  neocomplete#close_popup()
inoremap <expr> <C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr> <Space> pumvisible() ? "\<C-y>\<Space>" : "\<Space>"
inoremap <expr> <Esc> pumvisible() ? "\<C-y>\<Esc>" : "\<Esc>"

" Enable omni completion.
augroup specific_filetype
    autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
    autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
    autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
    autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
    autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
augroup END

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif

" Startify (Custom Startpage)
" --------------------------------------------------------

let g:startify_files_number = 5
let g:startify_custom_header =
    \ map(split(system('fortune -as | cowsay -f bud-frogs'), '\n'), '"   ".v:val') + ['']

" Better-Whitespace should not highlight the startify-page
au FileType startify ToggleWhitespace

" Configure the Startify list-order
let g:startify_list_order = [
    \ ['   Recently modified'],
    \ 'files',
    \ ['   Bookmarks'],
    \ 'bookmarks',
    \ ['  Sessions'],
    \ 'sessions',
    \ ['   Modified in current dir'],
    \ 'dir'
\]

let g:startify_bookmarks = [ '~/.vimrc', '~/.config/X11/Xresources', '~/.config/i3/config' ]
