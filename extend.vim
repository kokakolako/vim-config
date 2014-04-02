" Vim Extended-Configuration: Keymappings, Autocommands, Abbreviations

" Keymappings
" --------------------------------------------------------

" Uppercase the current word in insert mode
nnoremap <C-u> <esc>vawUi

" Calculate with the expression-register
" inoremap <C-c> <C-r>=

" Use a more comfortable Leader Key (for a QUERTZ keyboard-layout)
let mapleader = " "

" Remap the CtrlP mapping to
let g:ctrlp_map = "<Leader>p"
let g:ctrlp_user_command = 'ag %s -l --nocolor --hidden -g ""'

" Mapping better splitting
nnoremap <silent> <C-e> :wincmd w<CR>
nnoremap <silent> <C-k> :wincmd k<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-l> :wincmd l<CR>

inoremap <expr><TAB> neosnippet#expandable_or_jumpable() ?
            \ "\<Plug>(neosnippet_expand_or_jump)"
            \: pumvisible() ? "\<C-n>" : "\<TAB>"

" Fixing the behaviour of <C-n> and <C-p>
cnoremap <C-p> <up>
cnoremap <C-n> <down>

" Don't differ 'fake-lines'
nnoremap j gj
nnoremap k gk

" Use J,K to switch buffers + Join Lines with <C-J>
nnoremap <silent> J :bn<CR>
nnoremap <silent> K :bp<CR>
nnoremap <silent> <Leader>j :join<CR>

" Search for the same word but don't jump to it
nnoremap * *<C-O>

" Quickly toggle important settings
nnoremap <Leader>c :ColorToggle<CR>
nnoremap <Leader>s :StripWhitespace<CR>:echo "Removed the whitespace"<CR>
nnoremap <Leader>g :GitGutterToggle<CR>:echo "Toggled Gitgutter"<CR>
nnoremap <Leader>r :w<CR>:source %<CR>:echo "Sourced the current file"<CR>
nnoremap <Leader>v :split $HOME/.config/vim/vimrc<CR>
nnoremap <Leader>t :TagbarToggle<CR>
nnoremap <Leader>a :%s/->/→/g<CR>:echo "Replacing arrows"<CR>

" Jump to the buffers directory
nnoremap <Leader>ü :cd %:p:h<CR>:pwd<CR>

" Faster open the current Folding
nnoremap <silent> <Space><Space> za

" Jump through the GitGutter Hunks
" rmal! vaegq
nnoremap <silent> ]g :GitGutterNextHunk<CR>
nnoremap <silent> [g :GitGutterPrevHunk<CR>

" Autocommands
" --------------------------------------------------------

if has("autocmd")

    augroup ft_markdown
        " Enable Spellcheck
        au BufNewFile,BufRead,BufEnter *.md setlocal spell spelllang=de

        " Set textwidth to 76
        au BufNewFile,BufRead,BufEnter *.md setlocal textwidth=76
    augroup END

    " Disable Spellcheck in Help-Files
    au FileType help setlocal nospell

    " Enable marker-folding in Vim-files
    au FileType vim setlocal foldmethod=marker

    " Use pandoc to sort markdown (Use 'gq' in normal-mode)
    let pandoc_pipeline = "pandoc --from=markdown --to=markdown"
    au FileType markdown let &formatprg=pandoc_pipeline

endif

" Abbreviations
" --------------------------------------------------------

iabbrev -> →
iabbrev Vergelich Vergleich
iabbrev vergelich vergleich
