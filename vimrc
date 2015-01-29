" be vi improved!
set nocompatible

" runtime path
set rtp+=$HOME/.config/vim
runtime! plugins/vim-pathogen/autoload/pathogen.vim

" invoke pathogen
silent! execute pathogen#infect( "plugins/{}" )
silent! execute pathogen#infect( "src/{}" )
silent! execute pathogen#helptags()

" sourcing the other vim-config files
source $HOME/.config/vim/extend.vim

" filetype indenting + syntax highlighting
filetype plugin indent on
syntax on

" general settings
set term=screen-256color                           " set terminal name
set autoindent                                     " enable auto-identing
set autowrite                                      " automatically write when changing buffer
set encoding=utf-8                                 " enable utf-8 encoding
set backspace=indent,eol,start                     " use backspace in insert-mode
set showcmd                                        " show the previous command
set smarttab                                       " expand tabs specific to the filetype
set shiftround                                     " round the shiftwidth
set ttimeout                                       " enable a timeout
set ttimeoutlen=100                                " define the timeout length
set mouse=a                                        " enable mouse-support
set ruler                                          " show the cursor position all the time
set number                                         " show line numbers
set history=1000                                   " keep 1000 lines of command line history
set ignorecase                                     " ignore case when searching
set smartcase                                      " no ignorecase if uppercase char present
set laststatus=2                                   " always display statusbar
set title                                          " change terminal title to file name
set cursorline                                     " highlight the current line
set lazyredraw                                     " enable lazy redrawing to speed up macros
set expandtab                                      " expand tabs to spaces
set softtabstop=4                                  " control the colums which are used in insert-mode
set shiftwidth=4                                   " set the identing tab width
set tabstop=4                                      " changes the width of a tab
set hidden                                         " now its possible to switch buffers without saving
set undofile                                       " undo-file for permanent undo
set undodir=$HOME/.config/vim/undo                 " change the path of the permanent-undo file
set thesaurus+=$HOME/.config/vim/openthesaurus.txt " adding a german thesaurus-file
set wildmenu                                       " enable the wildmenu
set wildmode=full                                  " change the behaviour of wildmenu
set tabpagemax=50                                  " maximal 50 suggestions at tabcompletion
set backupdir=$HOME/.cache/vim/backup              " store backups in one global dir
set directory=$HOME/.cache/vim/swap                " store swap-files in one global dir
set linebreak                                      " break lines which are to long for the screen

" set the colorscheme
colorscheme hemisu

" enable 256 colors
if &t_Co > 2 || has( "gui_running" )
    set incsearch
    set t_Co=256
endif

" creating a viminfo-file
if !empty(&viminfo)
  set viminfo^=!
endif

" enable matchit.vim ( extend the capabilities of % )
if !exists('g:loaded_matchit') && findfile('plugin/matchit.vim', &rtp) ==# ''
  runtime! macros/matchit.vim
endif
