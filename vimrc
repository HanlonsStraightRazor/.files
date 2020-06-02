""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My vimrc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"   ____ ____  _                       ____ _              _     _
"  / ___/ ___|| |__   __ _ _ __ _ __  / ___| |__   ___  __| | __| | __ _ _ __
" | |   \___ \| '_ \ / _` | '__| '_ \| |   | '_ \ / _ \/ _` |/ _` |/ _` | '__|
" | |___ ___) | | | | (_| | |  | |_) | |___| | | |  __/ (_| | (_| | (_| | |
"  \____|____/|_| |_|\__,_|_|  | .__/ \____|_| |_|\___|\__,_|\__,_|\__,_|_|
"                              |_|
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap leader key to <space>
let mapleader = " "

" Automatically reloads vimrc when saved
autocmd! bufwritepost $MYVIMRC source %

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

" tComment commenter
Plugin 'tomtom/tcomment_vim'

" Supertab for insert mode tab completion
Plugin 'ervandew/supertab'

" ZoomWin for expanding and collapsing splits
" <C-w>o zooms in and out of selected split
Plugin 'ZoomWin'

" Surround.vim for surround things with other things
" Works via adjective 's' in normal mode
" Ex. cs"' changes surrounding "s to 's
Plugin 'tpope/vim-surround'

" Tagbar for viewing dynamically generated class outlines
Plugin 'majutsushi/tagbar'

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

" tcomment basic key bindings
" gc{motion}         :: Toggle comments (for small comments within one line
"                       the &filetype_inline style will be used, if defined)
" gc<Count>c{motion} :: Toggle comment with count argument
"                       (see|tcomment#Comment()|)
" gcc                :: Toggle comment for the current line

" Tagbar
" Toggle Tagbar with <leader>b
nnoremap <leader>b :TagbarToggle<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Netrw Configurations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Toggle Netrw with <leader>n
nnoremap <leader>n :Lex<CR>

" Hide dotfiles
let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex

" Hide banner
let g:netrw_banner=0

" Change how Netrw displays files and directories
" let g:netrw_liststyle=0    " Default view (directory/file name)
" let g:netrw_liststyle=1    " Show time and size
" let g:netrw_liststyle=2    " Show listing in 2 columns
  let g:netrw_liststyle=3    " Show tree listing

" Open vertical splits to the right
let g:netrw_browse_split = 4
let g:netrw_altv=1
" Open previews in a vertical split
let g:netrw_preview=1
" Set default window size to 20% of the current buffer
let g:netrw_winsize = -28

" Delete Netrw's buffer once it's hidden
autocmd FileType netrw setl bufhidden=delete

" Change directory to the current buffer when opening files.
set autochdir

" Search into subfolders and do tab-completion
set path+=**
" Display matching files on tab-complete
set wildmenu


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader Remaps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <leader>s toggles spell checker
nnoremap <leader>s :set spell!<CR>
" <leader>f fixes spelling
nnoremap <leader>f z=

" <leader>h clears highlighting
nnoremap <leader>h :noh<CR>

" <leader>w deletes all trailing whitespace
nnoremap <leader>w :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

" <leader>* gets number of occurrences of word under cursor
nnoremap <leader>* *<C-O>:%s///gn<CR>

" <leader>t opens a terminal in a vertical split
nnoremap <leader>t :vert ter<CR>

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
" Round indent to multiples of shiftwidth
set shiftround

" Don't lose highlighting when indenting with < and >
vnoremap < <gv
vnoremap > >gv

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

" Automatically save and load views (good for saving folds)
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview

" Move to windows easier with <C-h/j/k/l>
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn off modelines
set modelines=0

" Vim's auto indentation feature does not work
" properly with text copied from outside of Vim.
" Press the <F2> key to toggle paste mode on/off.
set pastetoggle=<F2>
" Make clipboard have expected behavior
set clipboard=unnamed

" Encoding
set encoding=utf-8

" Set spell checker language
set spelllang=en_us

" Store info from no more than 100 files at a time,
" 9999 lines of text, 100kb of data.
" Useful for copying large amounts of data between files.
set viminfo='100,<9999,s100

