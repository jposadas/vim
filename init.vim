""""""""""""""""
" Plugin Section
""""""""""""""""
call plug#begin('~/.vim/plugged')
    Plug 'gruvbox-community/gruvbox'
    Plug 'HerringtonDarkholme/yats.vim'
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
    Plug 'junegunn/fzf.vim'
call plug#end()

""""""""""""""""
" Config Section
""""""""""""""""
if (has("termguicolors"))
    set termguicolors
endif

syntax enable
filetype plugin on
colorscheme gruvbox

set guicursor=i:block-blinkwait0-blinkon200-blinkoff200

set nu
set nowrap
set nohlsearch
set expandtab
set ignorecase
set smartcase
set noswapfile
set incsearch
set shiftwidth=4
set tabstop=4
set softtabstop=4
set autoindent
set smartindent
set backspace=indent,eol,start
set re=0


"""""""""""""""
" File Explorer
"""""""""""""""
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''

" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Toggle
noremap <silent> <C-b> :NERDTreeToggle<CR>

""""""""""""""""
" File Searching
""""""""""""""""
nnoremap <C-p> :GFiles<CR>
let g:fzf_layout = {'down': '~20%'}
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

