" Helps force plug-ins to load correctly when it is turned back on below.
filetype off

" Turn on syntax highlighting
syntax on

" For plug-ins to load correctly
filetype plugin indent on

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

" Status bar
set laststatus=2

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

filetype plugin indent on
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

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>
