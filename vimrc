" be iMproved, required
set nocompatible
" required
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" solarized colorscheme
Plugin 'micha/vim-colors-solarized'

" lightline status bar
Plugin 'itchyny/lightline.vim'

" NERD Tree plugin for file browsing
Plugin 'preservim/nerdtree'

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
" see :h vundle for more details or wiki for FAQ
" Put non-Plugin stuff after this line

" Show status bar
set laststatus=2
" Adjust color of lightline
if !has('gui_running')
  set t_Co=256
endif
let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ }
" Get rid of -- INSERT -- (already in lightline)
set noshowmode

" Map NERD Tree to <F6>
map <F6> :NERDTreeToggle<CR>

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
set showmode
set showcmd

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Display different types of white spaces
set list
set listchars=tab:>\ ,trail:*,extends:#,nbsp:.

" Show line numbers
set number

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

" Shortcut ,<space> clears highlighting
nnoremap <silent> ,<space> :let @/=""<CR>

" Shortcut <F5> deletes all trailing whitespace
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
