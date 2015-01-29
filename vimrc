" Be Vi IMproved!
set nocompatible

" Runtime path
set rtp+=$HOME/.config/vim
runtime! plugins/vim-pathogen/autoload/pathogen.vim

set term=screen-256color

" Invoke Pathogen
silent! execute pathogen#infect( "plugins/{}" )
silent! execute pathogen#infect( "src/{}" )
silent! execute pathogen#helptags()

" Sourcing the other vim-config files
source $HOME/.config/vim/plugins.vim
source $HOME/.config/vim/extend.vim

set autoindent                                     " Enable auto-identing
set autowrite                                      " Automatically write when changing buffer
set encoding=utf-8                                 " Enable utf-8 encoding
set backspace=indent,eol,start                     " Use backspace in insert-mode
set showcmd                                        " Show the previous command
set smarttab                                       " Expand tabs specific to the filetype
set shiftround                                     " Round the shiftwidth
set ttimeout                                       " Enable a timeout
set ttimeoutlen=100                                " Define the timeout length
set mouse=a                                        " Enable mouse-support

" Filetype indenting + Syntax highlighting
filetype plugin indent on
syntax on

if &t_Co > 2 || has( "gui_running" )
    set incsearch
    set t_Co=256
endif

" Set the colorscheme
colorscheme hemisu

set ruler                                          " Show the cursor position all the time
set number                                         " Show line numbers
set history=1000                                   " Keep 1000 lines of command line history
set ignorecase                                     " Ignore case when searching
set smartcase                                      " No ignorecase if Uppercase char present
set laststatus=2                                   " Always display statusbar
set title                                          " Change terminal title to file name
set cursorline                                     " Highlight the current line
set lazyredraw                                     " Enable lazy redrawing to speed up macros
set expandtab                                      " Expand tabs to spaces
set softtabstop=4                                  " Control the colums which are used in insert-mode
set shiftwidth=4                                   " Set the identing tab width
set tabstop=4                                      " Changes the width of a tab
set hidden                                         " Now its possible to switch buffers without saving
set undofile                                       " Undo-File for permanent undo
set undodir=$HOME/.config/vim/undo                 " Change the path of the permanent-undo file
set thesaurus+=$HOME/.config/vim/openthesaurus.txt " Adding a german thesaurus-file
set wildmenu                                       " Enable the wildmenu
set wildmode=full                                  " Change the behaviour of wildmenu
set tabpagemax=50                                  " Maximal 50 suggestions at tabcompletion
set backupdir=$HOME/.cache/vim/backup              " Store backups in one global dir
set directory=$HOME/.cache/vim/swap                " Store swap-files in one global dir
set linebreak

" Creating a viminfo-file
if !empty(&viminfo)
  set viminfo^=!
endif

" Enable matchit.vim
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
