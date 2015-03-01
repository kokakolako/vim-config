" {{{1 Keymappings
" --------------------------------------------------------

" use a more <space> as leader
let mapleader = " "

" fixing the behaviour of <c-n> and <c-p>
cnoremap <C-p> <up>
cnoremap <C-n> <down>

" don't differ 'fake-lines'
nnoremap j gj
nnoremap k gk

" use J,K to switch between open buffers + join lines with <c-j>
nnoremap <silent> J :bn<cr>
nnoremap <silent> K :bp<cr>
nnoremap <silent> <leader>j :join<cr>

" search for the same word but don't jump to it
nnoremap * *<C-O>

" leader mappings
nnoremap <leader>c :ColorToggle<cr>
nnoremap <leader>s :StripWhitespace<cr>:echo "Removed the whitespace"<cr>
nnoremap <leader>g :GitGutterToggle<cr>:echo "Toggled Gitgutter"<cr>
nnoremap <leader>r :w<cr>:source %<cr>:echo "Sourced the current file"<cr>
nnoremap <leader>v :split $HOME/.config/vim/vimrc<cr>
nnoremap <leader>t :TagbarToggle<cr>
nnoremap <leader>a :%s/->/→/g<cr>:echo "Replacing arrows"<cr>
nnoremap <silent> <leader>u :GundoToggle<cr>
nnoremap <silent> <leader>m :!pandoc -f markdown -t pdf %<cr>:echo "Finished compiling to PDF"<cr>

" jump to the buffers directory
nnoremap <leader>ü :cd %:p:h<cr>:pwd<cr>

" open the current folding with <space><space>
nnoremap <silent> <space><space> za

" jump through the gitgutter hunks
nnoremap <silent> ]g :GitGutterNextHunk<cr>
nnoremap <silent> [g :GitGutterPrevHunk<cr>

" }}}1
" {{{1 Autocommands
" --------------------------------------------------------

if has("autocmd")
    augroup new_buffer
        " *.md = markdown
        au BufNewFile,BufRead *.md set filetype=markdown
        " enable spellcheck
        au BufNewFile,BufRead,BufEnter *.md setlocal spell
        " set textwidth to 76
        au BufNewFile,BufRead,BufEnter *.md setlocal textwidth=76
    augroup END
    augroup filetype_specific
        " disable spellcheck in help-files
        au FileType help setlocal nospell
        " enable marker-folding in vim-files
        au FileType vim setlocal foldmethod=marker
        " use pandoc to prettify markdown (use 'gq' in normal-mode)
        let pandoc_pipeline = "pandoc -f markdown -t markdown"
        au FileType markdown,text let &formatprg=pandoc_pipeline
    augroup END
endif

"}}}
" {{{1 Plugins
" --------------------------------------------------------
" {{{2 Airline
" ------------------------

let g:airline_powerline_fonts = 0 " use powerline fonts
let g:airline_theme = "hemisu_airline" " use a nice airline theme
let g:airline#extensions#whitespace#enabled = 1 " enable the whitespace extension
let g:airline#extensions#tagbar#enabled = 1 " enabling the tagbar extension
let g:airline#extensions#whitespace#checks = [ "indent", "trailing" ] " show trailing whitespace and identing
let g:airline#extensions#whitespace#show_message = 1 " show a message ater cleanling whitespace

" rice airline
let g:airline_left_sep = " "
let g:airline_right_sep = " "
let g:airline_left_alt_sep = "|"
let g:airline_right_alt_sep = "|"

"}}}2
" {{{2 Startify
" ------------------------

" show only the 5 recently modified files
let g:startify_files_number = 5
"
" better-whitespace should not highlight whitespace at startify
au FileType startify silent! ToggleWhitespace

" configure the startify list-order
let g:startify_list_order = [
    \ ['   Recently modified'], 'files',
    \ ['   Bookmarks'], 'bookmarks',
    \ ['   Modified in current dir'], 'dir'
\]
" my bookmarks
let g:startify_bookmarks = [ '~/.config/vim/vimrc', '~/.config/X11/Xresources', '~/.config/herbstluftwm/autostart', '~/.config/herbstluftwm/panel', '~/.config/sxhkd/sxhkdrc' ]

"}}}2
" {{{2 3.4 ctrlp
" ------------------------

let g:ctrlp_map = '<NUL>' " open ctrlp with <C-space>

" }}}2
"}}}1
" vim: fdm=marker
