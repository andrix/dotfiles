filetype off
call pathogen#infect()
filetype on
filetype plugin on
filetype plugin indent on

set nocompatible       " vi--

set smarttab           " tabulacion, indentacion, etc
set shiftwidth=4
set expandtab
set tabstop=4
set smartindent
set autoindent
set number
set encoding=utf-8
set showmatch          " al insertar closing brackets mostrar el opening bracket
set ignorecase         " ignorar mayusculas/minusculas en las busquedas
set foldmethod=marker  " foldmethod por defecto
set pastetoggle=<F11>  " para habilitar y deshabilitar rapido el modo paste 
set hidden             " para poder switchear buffers sin grabar
set wildmenu           " mostrar menu scrollable al buscar archivos
set wildmode=list:longest,full  " que al primer TAB muestre lista completa y con el segundo recorrar los files
set modelines=0
set laststatus=2
set undofile
set visualbell
set ttyfast

" Colors **********************************************************************
syntax on
set t_Co=256
set background=dark    " para conservar la vista hasta los 80
colorscheme molokai
set guifont=Inconsolata-dz\ for\ Powerline\ 10
let g:Powerline_symbols = 'fancy'
" *****************************************************************************

" Searching *******************************************************************
set hlsearch  " highlight search
set incsearch  " incremental search, search as you type
set ignorecase " Ignore case when searching 
set smartcase " Ignore case when searching lowercase
" *****************************************************************************

" Cursor highlights ***********************************************************
set cursorline
" set cursorcolumn
" *****************************************************************************

" Status Line *****************************************************************
" set showcmd
" set showmode
" set ruler " Show ruler
" set ch=2 " Make command line two lines high
" match LongLineWarning '\%120v.*' "Error format when a line is longer than 120
" *****************************************************************************

" Line Wrapping ***************************************************************
set nowrap
set linebreak  " Wrap at word
" *****************************************************************************

" Mappings ********************************************************************
" Professor VIM says '87% of users prefer jj over esc', jj abrams disagrees
imap jj <Esc>
" *****************************************************************************

" -----------------------------------------------------------------------------  
" |                              Plug-ins                                     |
" -----------------------------------------------------------------------------  
 
" NERDTree ********************************************************************
:noremap ,n :NERDTreeToggle<CR>
 
" User instead of Netrw when doing an edit /foobar
let NERDTreeHijackNetrw=1
 
" Single click for everything
let NERDTreeMouseMode=1

" Share tree across tabs
let NERDTreeMirror=1
" ******************************************************************

" -----------------------------------------------------------------------------  
" |                               Startup                                     |
" -----------------------------------------------------------------------------  
" Open NERDTree on start
"autocmd VimEnter * NERDTree
" autocmd VimEnter * wincmd p
" ******************************************************************


if exists("+showtabline")
    source ~/.vim/tabline.vim
endif

" mis keybindings
map <C-l> 0/^\s\+<CR>ddj<C-l>
map <space> <C-w>w
cmap bq :bufdo q<CR>
map ,, <C-w>w

"" Nosetest over current buffer
nmap ns :! nosetests %<CR>

" matias tips
map Y "+y$
map CP "+p
set undodir=~/.vim/undodir undofile undolevels=1000 undoreload=10000


" Follow some advices from Steve losh
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

