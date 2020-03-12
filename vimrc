" Be iMproved, required
set nocompatible
" Required
filetype off

" Remap leader key to <space>
let mapleader = ","

" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Alternatively, pass a path where Vundle should install plugins
" Call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Solarized colorscheme
Plugin 'micha/vim-colors-solarized'

" Lightline status bar
Plugin 'itchyny/lightline.vim'

" NERD Tree plugin for file browsing
Plugin 'preservim/nerdtree'

" NERD Commenter for effective code commenting
" <leader>cc comments current line or visual selection
Plugin 'preservim/nerdcommenter'

" Auto pairs for automatic braces
Plugin 'jiangmiao/auto-pairs'

" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" See :h vundle for more details or wiki for FAQ
" Put non-Plugin stuff after this line

" Show status bar
set laststatus=2
" Adjust color of lightline
" lightline isn't colored properly
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
" Get rid of -- INSERT -- (already in lightline)
set noshowmode
" Turn on syntax highlighting
syntax on

" Map NERD Tree to <F6>
map <F6> :NERDTreeToggle<CR>

" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1
" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1
" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1
" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1
" Enable NERDCommenterToggle to check all selected lines is commented or not
let g:NERDToggleCheckAllLines = 1

" Turn off modelines
set modelines=0

" Automatically wrap text that extends beyond the screen length
set wrap

" Vim's auto indentation feature does not work properly with text copied from outside of Vim.
" Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-0>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Display 5 lines above/below the cursor when scrolling with a mouse
set scrolloff=5
" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Display options
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces
set list
set listchars=tab:>\ ,trail:*,extends:#,nbsp:.

" Show current line number and relative line numbers
set number relativenumber

" Encoding
set encoding=utf-8

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search terms
set smartcase

" Store info from no more than 100 files at a time, 9999 lines of text, 100kb of data.
" Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

" Show existing tab with 2 spaces width
set tabstop=2
" When indenting with '>', use 2 spaces width
set shiftwidth=2
" Set number of spaces inserted an deleted when tab is pressed
set softtabstop=2
" On pressing tab, insert 2 spaces
set expandtab

" Shortcut <leader><space> clears highlighting
nnoremap <silent> <leader><space> :let @/=""<CR>

" Shortcut <F5> deletes all trailing whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" Remap to kj <Esc> in insert mdoe
inoremap kj <Esc>
" Remap to kj Ctrl-c in command mode
cnoremap kj <C-c>

" <leader>* gets number of occurrences of word under cursor
map <leader>* *<C-O>:%s///gn<CR>
