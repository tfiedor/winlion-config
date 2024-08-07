set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim

" Set fzf for the fzf.vim plugin
set rtp +=~/.fzf

call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Interface for AG and fzf (Silver Searcher)
Plugin 'mileszs/ack.vim'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Binding for python completion engine (jedi)
Plugin 'davidhalter/jedi-vim'

" Linting for bigger number of languages
Plugin 'w0rp/ale'

" EasyMotion for vimium-like movement around documents
Plugin 'easymotion/vim-easymotion'

" Changed power line
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim' " Less customizable but smoother
" Plugin 'bling/vim-airline' " Highly customizable

" Add syntactic highlights for big number of languages
" Fixme: Does this work?
Plugin 'sheerun/vim-polyglot'
Plugin 'lambdalisue/vim-cython-syntax'

" Plugin for surrounding text with commas or tags
Plugin 'tpope/vim-surround'

" Enables repeating for surround and commentary
Plugin 'tpope/vim-repeat'

" Allows quick toggling of comments through gcc/gc/gcgc notions
Plugin 'tpope/vim-commentary'

" Preview CSS colours in the vim
Plugin 'ap/vim-css-color'

" Filesystem tree browsing
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'scrooloose/nerdtree'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" Fix for colors
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

" Colour related section
syntax on
" colorscheme space-vim-dark

set hlsearch       " highlight searches
set incsearch      " incremental search, as you type

set visualbell
set showmode
set showcmd        " show command in bottom bar
set number         " show line numbers in vim
set relativenumber " set relative numbering for the vim

set wildmenu       " visual autocompletion for command menu (e.g. files)

set expandtab      " turn tabulators to spaces
set softtabstop=4  " number of spaces added when hitting the <TAB>
set tabstop=4      " number of spaces interpreted by vim from <TAB> key

" Make whitespace (tabs and spaces) visible
set list
set listchars=tab:>-,space:·

" Turn off the highlight by typing "<leader> "
let mapleader = "\<space>"
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <leader>h :bprev<CR>
nnoremap <leader>l :bnext<CR>

" Remap for quick AG usage
nnoremap <leader>a :Ag 

" Map nerdtree stuff
map <leader>n <plug>NERDTreeTabsToggle<CR>

" Move vertically by visual lines, i.e. if there is something wrapped it will
" move inside
nnoremap j gj
nnoremap k gk
" Remap nexts center the screen around
nnoremap n nzz
nnoremap N Nzz
nnoremap } }zz
nnoremap { {zz
" Remap escape to jk to ease the pain
inoremap jk <esc>

" fzf remappings
nnoremap <leader>f :Files<CR>
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Lines<CR>

" Trying to fix the fucking indentation in vim
let g:tex_flavor='latex'
let g:tex_indent_brace=0
let g:tex_noindent_env = 'document\|verbatim\|lstlisting\|mydef\|abstract\|itemize\|enumerate\|paragraph\|inparaenum'
let g:tex_itemize_env = ''
let g:tex_indent_items=0

if $LIGHT_MODE == "true"
    set background=light
    colorscheme PaperColor
else
    colorscheme badwolf
endif

" Make the tab line lighter than the background
let g:badwolf_tabline = 2
let g:badwolf_darkgutter = 1
set cursorline

" git-gutter options
let g:gitgutter_realtime = 1
let g:gitgutter_updatetime = 50

" Enabling AG in ack
let g:ackprg = 'ag --vimgrep'

" Powerline options
set laststatus=2 " This will force to show the status line
set linespace=2

" Load specialized configuration for selected file types
autocmd FileType markdown,rst source ~/.vim/prose.vim
" autocmd FileType tex,latex colorscheme gruvbox
