""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Important
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap leader key to <space>
let mapleader=" "

" Automatically reload vimrc when saved
autocmd! bufwritepost $MYVIMRC source %

" Turn on syntax highlighting
syntax enable
" Enable transparent background
hi Normal guibg=NONE ctermbg=NONE

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Installation
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Initialize plugins
call plug#begin('~/.vim/plugged')

" Lightline status bar
Plug 'itchyny/lightline.vim'

" tComment commenter
Plug 'tomtom/tcomment_vim'

" vim-surround for surround things with other things
Plug 'tpope/vim-surround'

" Tagbar for viewing dynamically generated outlines
Plug 'majutsushi/tagbar'

" fzf for fuzzy file finding
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'

" AsyncRun for asyncronous jobs
Plug 'skywind3000/asyncrun.vim'

" Use pywal colorscheme
Plug 'dylanaraps/wal.vim'

" All Plugins must be added before the following line
call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin Settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Lightline
" Show status line
set laststatus=2
" Get rid of -- INSERT -- (already in lightline)
set noshowmode
" Set Lightline colorscheme
let g:lightline={
  \ 'colorscheme' : 'wombat',
  \ }

" Wal
" Set colorscheme to the one provided by pywal
colorscheme wal

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Netrw Configurations
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
" let g:netrw_browse_split=4
" let g:netrw_altv=1
" Open previews in a vertical split
let g:netrw_preview=1
" Set default window size to 20% of the current buffer
let g:netrw_winsize=-28

" Delete Netrw's buffer once it's hidden
autocmd FileType netrw setl bufhidden=delete

" Don't change directory to the current buffer when opening files
set noautochdir
" Search into subfolders and do tab-completion
set path+=**
" Display matching files on tab-complete
set wildmenu

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader Maps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Plugins
" Toggle Netrw
nnoremap <leader>n :Lex<cr>
" Toggle Tagbar
nnoremap <leader>t :TagbarToggle<cr>
" List buffers with fzf
nnoremap <leader>b :Buffers<cr>
" List files with fzf
nnoremap <leader>o :Files<cr>
" Run make asyncronously
nnoremap <leader>m :w<cr>:AsyncRun make<cr>

" Toggle spell checker
nnoremap <leader>s :set spell!<cr>
" Fix spelling
nnoremap <leader>f z=

" Clear highlighting
nnoremap <leader>h :noh<cr>

" Delete all trailing whitespace
nnoremap <leader>w :let _s=@/<bar>:%s/\s\+$//e<bar>:let @/=_s<bar><cr>

" Get number of occurrences of word under cursor
nnoremap <leader>* *<c-O>:%s///gn<cr>

" Toggle quickfix window
nnoremap <leader>c :cw<cr>

" Quit
nnoremap <leader>q :q<cr>

" Need to remap redraw for later <c-l> remapping to work
nnoremap <leader>l <c-l>
" Need to unmap <c-j> too
let g:BASH_Ctrl_j='off'
let g:C_Ctrl_j='off'
nnoremap <leader>j <c-j>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Other Remaps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Remap to kj <esc> in insert mode
inoremap kj <esc>
" Remap to kj Ctrl-c in command mode
cnoremap kj <c-c>
" Get out of visual mode with kj
vnoremap kj <esc>gV

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Spacing
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Display different types of white spaces
set list
set listchars=tab:>\ ,trail:*,extends:#,nbsp:.

" Show tabs as 4 spaces
set tabstop=4
" When indenting with '>', use 4 spaces
set shiftwidth=4
" Set number of spaces inserted and deleted when <tab> is pressed
set softtabstop=4
" Insert `tabstop` number of spaces when pressing <tab>
set expandtab
" Round indent to multiples of shiftwidth
set shiftround

" Don't lose highlighting when indenting with < and >
vnoremap < <gv
vnoremap > >gv

" Convert between tabs and spaces for indenting
:command! -range=% -nargs=0 Tab2Space execute
    \ '<line1>,<line2>s#^\t\+#\=repeat(" ", len(submatch(0))*' . &ts . ')'
:command! -range=% -nargs=0 Space2Tab execute
    \ '<line1>,<line2>s#^\( \{'.&ts.'\}\)\+#\=repeat("\t", len(submatch(0))/' . &ts . ')'

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

" Automatically save and load views
au BufWinLeave *.* mkview
au BufWinEnter *.* silent loadview

" Move to windows easier with <c-h/j/k/l>
" and move around windows easier with <left/down/up/right>
nnoremap <Left> <c-w>H
nnoremap <Down> <c-w>J
nnoremap <Up> <c-w>K
nnoremap <Right> <c-w>L
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Turn off modelines
set modelines=0

" Enable buffer hiding without saving
set hidden

" Vim's auto indentation feature does not work
" properly with text copied from outside of Vim.
" Press the <f2> key to toggle paste mode on/off.
set pastetoggle=<f2>
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

