""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" A Good Vimrc
" Author: CSharpCheddar
" Version: 2.0
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap leader key to <space>
let mapleader = " "

" Turn on syntax highlighting
syntax enable
" Pipboy 3000 colorscheme
colorscheme pipboy3000-green

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Installation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Be iMproved, required
set nocompatible
" Required
filetype off


" Set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Alternatively, pass a path where Vundle should install plugins
" Call vundle#begin('~/some/path/here')

" Let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Lightline status bar
Plugin 'itchyny/lightline.vim'

" NERD Tree plugin for file browsing
Plugin 'preservim/nerdtree'

" tComment commenter
Plugin 'tomtom/tcomment_vim'

" Syntastic lint checker
Plugin 'vim-syntastic/syntastic'

" Supertab for insert mode tab completion
Plugin 'ervandew/supertab'

" ZoomWin for expanding and collapsing splits
" <C-w>o zooms in and out of selected split
Plugin 'ZoomWin'

" Surround.vim for surround things with other things
" Works via adjective 's' in normal mode
" Ex. cs"' changes surrounding "s to 's
Plugin 'tpope/vim-surround'

" All Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
" filetype plugin on

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!`
"                     to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins;
"                     append `!` to auto-approve removal
"
" See :h vundle for more details or wiki for FAQ
" Put non-Plugin stuff after this line

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Lightline
" Show status line
set laststatus=2
" Get rid of -- INSERT -- (already in lightline)
set noshowmode

" NERD Tree
" Map NERD Tree to <F5>
map <F5> :NERDTreeToggle<CR>

" Syntastic recommended default configs
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader Remaps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle spell checker with <leader>s
nnoremap <leader>s :set spell!<CR>
" Fix spelling with <leader>f
nnoremap <leader>f 1z=

" Shortcut <leader>h clears highlighting
nnoremap <leader>h :noh<CR>

" Shortcut <leader>w deletes all trailing whitespace
nnoremap <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" <leader>* gets number of occurrences of word under cursor
map <leader>* *<C-O>:%s///gn<CR>

"
" Snippets
"

" Java main class and method
nnoremap <leader>java :-1read ./snippets/java.java<CR>jo<Tab>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other Remaps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap to kj <Esc> in insert mdoe
inoremap kj <Esc>
" Remap to kj Ctrl-c in command mode
cnoremap kj <C-c>
" Get out of visual mode with kj
vnoremap kj <Esc>gV

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" New Commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Create tags file
" ^] jumps to tag under cursor
" g^] for ambiguous tags
" ^t jumps up tag stack
command! MakeTags !ctags -R .

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spacing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Display different types of white spaces
set list
set listchars=tab:>\ ,trail:*,extends:#,nbsp:.

" Show existing tab with 2 spaces width
set tabstop=2
" When indenting with '>', use 2 spaces width
set shiftwidth=2
" Set number of spaces inserted an deleted when tab is pressed
set softtabstop=2
" On pressing tab, insert 2 spaces
set expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Searching
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Highlight matching search patterns
set hlsearch
" Enable incremental search
set incsearch
" Include matching uppercase words with lowercase search term
set ignorecase
" Include only uppercase words with uppercase search terms
set smartcase

" Search into subfolders and do tab-completion
set path+=**
" Display matching files on tab-complete
set wildmenu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Accessibility
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Automatically wrap text that extends beyond the screen length
set wrap

" Display 5 lines above/below the cursor when scrolling with a mouse
set scrolloff=5

" Fixes common backspace problems
set backspace=indent,eol,start

" Speed up scrolling in Vim
set ttyfast

" Show current line number and relative line numbers
set number relativenumber

" Highlight matching pairs of angle brackets.
" Use the '%' character to jump between them.
set matchpairs+=<:>

" Display options
set showcmd

" Color column w/o column (yells at you for any line over 80 characters long)
au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn off modelines
set modelines=0

" Vim's auto indentation feature does not work
" properly with text copied from outside of Vim.
" Press the <F2> key to toggle paste mode on/off.
nnoremap <F2> :set invpaste paste?<CR>
imap <F2> <C-0>:set invpaste paste?<CR>
set pastetoggle=<F2>

" Encoding
set encoding=utf-8

" Store info from no more than 100 files at a time,
" 9999 lines of text, 100kb of data.
" Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

