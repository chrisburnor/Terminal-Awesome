set nocompatible               " be iMproved
filetype off                   " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
Bundle 'gmarik/vundle'

" My Bundles here:
Bundle 'L9'
Bundle 'FuzzyFinder'
Bundle 'fugitive.vim'
Bundle 'Tabular'
Bundle 'vim-scripts/The-NERD-tree'
Bundle 'Haml'
Bundle 'Sass'
Bundle 'kchmck/vim-coffee-script'
Bundle 'vim-scripts/SuperTab-continued.'
Bundle 'taglist.vim'
Bundle 'Tagbar'
Bundle 'surround.vim'
Bundle 'ZenCoding.vim'
Bundle 'chrisburnor/project_fuzzyfinder'
Bundle 'ftpluginruby.vim'
Bundle 'endwise.vim'
Bundle 'altercation/vim-colors-solarized'
Bundle 'matchit.zip'

filetype plugin indent on     " required! 
" or 
" filetype plugin on          " to not use the indentation settings set by plugins

" Hide buffers instead of closing them when opening a nfew file with unwritten changes
set hidden
set tabstop=2
set backspace=indent,eol,start

" Set max number of tabs
set tabpagemax=50
" File tabs allways visible
set showtabline=2

" expand tabs to spaces
set expandtab

set autoindent
set copyindent
set smartindent
set number
set shiftwidth=2
set shiftround
set showmatch
set ignorecase
set smartcase

set smarttab
set hlsearch
set incsearch

set history=1000
set undolevels=1000
set wildignore=*.swp,*.bak,*.pyc,*.class

" New tab bindings
noremap :te :tabe 
noremap <silent> tl :tabnext<cr>
noremap <silent> th :tabprevious<cr>

" move tabs left and right according to standard vim keybindings
nmap <silent> :tmh<cr> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nmap <silent> :tml<cr> :execute 'silent! tabmove ' . tabpagenr()<CR>

" NERDtree plugin
nmap <S-t> :NERDTreeToggle<cr> 

" Better split keys
nmap _ :sp<cr>
nmap <Bar> :vsp<cr>

" Better window changing keys
nmap 1 <C-w>

if &t_Co >= 256 || has("gui_running")
    "set background=dark
    "colorscheme solarized
	  colorscheme mustang
endif

" switch syntax highlighting on, when the terminal has colors
if &t_Co > 2 || has("gui_running")
	syntax on
endif

" Omnicompletion
filetype plugin on
set ofu=syntaxcomplete#Complete

" Ctags Shortcuts
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" Taglist Configuration
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <F4> :TlistToggle<cr>

map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

" Make sure that the cursor does not change position when switching from
" insert to command mode
inoremap <silent> <Esc> <Esc>`^

" Source the vimrc file after saving it
if has("autocmd")
  autocmd bufwritepost .vimrc source $MYVIMRC
endif

" Project Fuzzyfinder shortcut
"map f :call ProjectFuzzyFind()<CR>

" Make it easy to open vimrc
let mapleader = ","
nmap <leader>v :tabedit $MYVIMRC<CR>

" Use semicolon instead of colon to enter commands
" Must be last so that previous commands don't break
map ; :
