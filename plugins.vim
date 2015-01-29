" Airline (lightweight powerline alternative)
" --------------------------------------------------------

" Use powerline fonts
let g:airline_powerline_fonts = 0

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

" Enabling Tagbar
let g:airline#extensions#tagbar#enabled = 1

" Startify (Custom Startpage)
" --------------------------------------------------------

let g:startify_files_number = 5

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

" SuperTab
" --------------------------------------------------------

" Enable completion of filenames via SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabContextDefaultCompletionType = "<c-n>"

" CtrlP
" --------------------------------------------------------

let g:ctrlp_map = '<NUL>'
