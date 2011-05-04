" ----------------------------------------------------------------------------- 
" |                            VIM Settings                                   |
" |                   (see gvimrc for gui vim settings)                       |
" |                                                                           |
" | Some highlights:                                                          |
" |   jj = <esc>  Very useful for keeping your hands on the home row          |
" |   ,n = toggle NERDTree off and on                                         |
" |                                                                           |
" |   ,f = fuzzy find all files                                               |
" |   ,b = fuzzy find in all buffers                                          |
" |                                                                           |
" |   hh = inserts '=>'                                                       |
" |   aa = inserts '@'                                                        |
" |                                                                           |
" |   ,h = new horizontal window                                              |
" |   ,v = new vertical window                                                |
" |                                                                           |
" |   ,i = toggle invisibles                                                  |
" |                                                                           |
" |   enter and shift-enter = adds a new line after/before the current line   |
" |                                                                           |
" |   :call Tabstyle_tabs = set tab to real tabs                              |
" |   :call Tabstyle_spaces = set tab to 2 spaces                             |
" |                                                                           |
" | Put machine/user specific settings in ~/.vimrc.local                      |
" -----------------------------------------------------------------------------  

set nocompatible       " vi--

set smarttab           " tabulacion, indentacion, etc
set shiftwidth=4
set expandtab
set tabstop=4
set smartindent
set autoindent
set number

set showmatch          " al insertar closing brackets mostrar el opening bracket
set ignorecase         " ignorar mayusculas/minusculas en las busquedas
set foldmethod=marker  " foldmethod por defecto
set pastetoggle=<F11>  " para habilitar y deshabilitar rapido el modo paste 
set hidden             " para poder switchear buffers sin grabar
set wildmenu           " mostrar menu scrollable al buscar archivos
set wildmode=list:longest,full  " que al primer TAB muestre lista completa y con el segundo recorrar los files

" Line width to 80 / wrap text
" set tw=80
" set wrap

" Colors **********************************************************************
syntax on
set t_Co=256
colorscheme tir_black
set background=dark    " para conservar la vista hasta los 80
"highlight Normal ctermbg=darkgray ctermfg=white
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
set showcmd
set showmode
set ruler " Show ruler
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

" Directories *****************************************************************
" Setup backup location and enable
" set backupdir=~/.vim/backup
" set backup

" Set Swap directory
" set directory=~/.vim/swap
" *****************************************************************************

" Mouse
" ***********************************************************************
" set mouse=a " Enable the mouse
" "behave xterm
" "set selectmode=mouse
" *****************************************************************************
 
" Python stuff
" ******************************************************************
" compiler python         " Enable compiler support for ruby
" map <F5> :!python %<CR>
" ******************************************************************

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


" para que use folding inteligente en archivos php
let php_folding = 1

" tab completion
function! CleverTab()
	if strpart(getline("."), 0, col('.')-1) =~ '^\s*$'
		return "\<TAB>"
	else
		return "\<C-N>"
	endfunction
inoremap <TAB> <C-R>=CleverTab()<CR>
set backspace=indent,eol,start

" mostrar numero de lineas para archivos php
" autocmd filetype php set number
autocmd filetype php set keywordprg=phpman
autocmd filetype docbk set foldmethod=syntax

au Bufenter *.inc set filetype=php
au Bufenter *.class set filetype=php
au Bufenter *.proc set filetype=php

" para el slrn
au Bufenter .letter set filetype=mail

" tildes y caracteres especiales: para usar los mismos shortcuts que mac 

" para compatibilidad con todas las terminales 
map! <A-e> e
map! <A-n> n
map! <A-u> u

map! ea <C-k>'a
map! eA <C-k>'A
map! ee <C-k>'e
map! eE <C-k>'E
map! ei <C-k>'i
map! eI <C-k>'I
map! eo <C-k>'o
map! eO <C-k>'O
map! eu <C-k>'u
map! eU <C-k>'U
map! en <C-k>?n
map! eN <C-k>?N
map! 1 <C-k>!I
map! ? <C-k>?I

" custom key bindings

set backspace=indent,eol,start
" para hacer word wrap de parrafos al escribir mails
noremap Q gq}
map ,w :w<CR>
map ,q :wq<CR>
map ,x :q!<CR>
map ,d :bd<CR>
map ,n :bn<CR>
map ,p :bp<CR>
map ,, :noh<CR>

" correccion ortografica (spanish)
map ,s :w!<CR>:!aspell check --lang=es -e %<CR>:e! %<CR>
" correccion ortografica (english)
map ,e :w!<CR>:!aspell check --lang=en -e %<CR>:e! %<CR>
" pylinteo
map ,y :!pylint %<CR>

"if has("autocmd")
"    autocmd FileType python set complete+=k/home/andres/.vim/pydiction-0.5/pydiction isk+=.,(
"endif

" diferencias del archivo actual con la version del repo
function! SvnDiff()
    let ft = &ft
    let fp = expand("%:p:h")
    let fn = expand("%:t")
    execute ":vertical belowright diffsplit ".fp."/.svn/text-base/".fn.".svn-base"
    execute ":set filetype=".ft
    execute ":wincmd h"
    unlet fp fn ft
endfunction
nmap ,d :call SvnDiff()<CR>

" diferencias del archivo actual con la version del repo
function! SvnUnDiff()
    execute ":bd"
    execute ":diffoff"
endfunction
nmap ,D :call SvnUnDiff()<CR>

map <F2> :tabprevious<CR>
map <F3> :tabnext<CR>

filetype on
filetype plugin on

" comment (#)
nmap sc 0i# <ESC>
vmap <silent> sc :s/^/# /<CR>:silent noh<CR>
" uncomment (#)
nmap su :s/^# //<CR>
vmap <silent> su :s/^# //<CR>:silent noh<CR>

if exists("+showtabline")
    source ~/.vim/tabline.vim
endif


" Pig latin
augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END 


" mis keybindings
map <C-l> 0/^\s\+<CR>ddj<C-l>
map <space> <C-w>w
cmap bq :bufdo q<CR>

map spt <ESC>dw<ESC>i<C-V><TAB><ESC>

" matias tips
map Y "+y$
map CP "+p


" Follow some advices from Steve losh
set modelines=0
" set relativenumber
" set undofile
set visualbell
set ttyfast
let g:ackprg="ack-grep -H --nocolor --nogroup --column"

call pathogen#runtime_append_all_bundles()

