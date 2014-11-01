" Vim Extended-Configuration: Keymappings, Autocommands, Abbreviations

" Keymappings
" --------------------------------------------------------

" Uppercase the current word in insert mode
nnoremap <C-u> <esc>vawUi

" Use a more comfortable Leader Key (for a QUERTZ keyboard-layout)
let mapleader = " "

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

" Leader Mappings
" --------------------------------------------------------

nnoremap <Leader>c :ColorToggle<CR>
nnoremap <Leader>s :StripWhitespace<CR>:echo "Removed the whitespace"<CR>
nnoremap <Leader>g :GitGutterToggle<CR>:echo "Toggled Gitgutter"<CR>
nnoremap <Leader>r :w<CR>:source %<CR>:echo "Sourced the current file"<CR>
nnoremap <Leader>v :split $HOME/.config/vim/vimrc<CR>
nnoremap <Leader>t :TagbarToggle<CR>
nnoremap <Leader>a :%s/->/→/g<CR>:echo "Replacing arrows"<CR>
nnoremap <silent> <Leader>u :GundoToggle<CR>

" Adding a modeline
nnoremap <silent> <Leader>m :normal Gi" vim: ft=vim fmr="{{{,}}}" fdm=manual<CR>

" Jump to the buffers directory
nnoremap <Leader>ü :cd %:p:h<CR>:pwd<CR>

" Faster open the current Folding
nnoremap <silent> <Space><Space> za

" Jump through the GitGutter Hunks
nnoremap <silent> ]g :GitGutterNextHunk<CR>
nnoremap <silent> [g :GitGutterPrevHunk<CR>

" Navigate through the splits the same way like in tmux
" http://www.codeography.com/2013/06/19/navigating-vim-and-tmux-splits
" --------------------------------------------------------

if exists('$TMUX')
  function! TmuxOrSplitSwitch(wincmd, tmuxdir)
    let previous_winnr = winnr()
    silent! execute "wincmd " . a:wincmd
    if previous_winnr == winnr()
      call system("tmux select-pane -" . a:tmuxdir)
      redraw!
    endif
  endfunction

  let previous_title = substitute(system("tmux display-message -p '#{pane_title}'"), '\n', '', '')
  let &t_ti = "\<Esc>]2;vim\<Esc>\\" . &t_ti
  let &t_te = "\<Esc>]2;". previous_title . "\<Esc>\\" . &t_te

  nnoremap <silent> <C-h> :call TmuxOrSplitSwitch('h', 'L')<cr>
  nnoremap <silent> <C-j> :call TmuxOrSplitSwitch('j', 'D')<cr>
  nnoremap <silent> <C-k> :call TmuxOrSplitSwitch('k', 'U')<cr>
  nnoremap <silent> <C-l> :call TmuxOrSplitSwitch('l', 'R')<cr>
else
  map <C-h> <C-w>h
  map <C-j> <C-w>j
  map <C-k> <C-w>k
  map <C-l> <C-w>l
endif

" Autocommands
" --------------------------------------------------------

if has("autocmd")

    augroup specific_filetype

        " Disable Spellcheck in Help-Files
        au FileType help setlocal nospell
        " Enable marker-folding in Vim-files
        au FileType vim setlocal foldmethod=marker

        " Use pandoc to sort markdown (Use 'gq' in normal-mode)
        let pandoc_pipeline = "pandoc --from=markdown --to=markdown"
        au FileType markdown,text let &formatprg=pandoc_pipeline"{{{"}}}

    augroup END

    augroup detect_filetype_while_opening_buffer

        " Mutt Mail settings
        autocmd BufRead,BufNewFile *mutt-* setfiletype mail
        " Enable Spellcheck
        au BufNewFile,BufRead,BufEnter *.md setlocal spell

        " Set textwidth to 76
        au BufNewFile,BufRead,BufEnter *.md setlocal textwidth=76

    augroup END

endif

" Abbreviations
" --------------------------------------------------------

iabbrev -> →
iabbrev Vergelich Vergleich
iabbrev vergelich vergleich

" vim: ft=vim fmr="{{{,}}}" fdm=manual" vim: ft=vim fmr="{{{,}}}" fdm=manual" vim: ft=vim fmr="{{{,}}}" fdm=manual
