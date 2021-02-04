""""""""""""""""
" Plugin Section
""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'gruvbox-community/gruvbox'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'iloginow/vim-stylus'

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
set background=dark

set guicursor=i:block-blinkwait0-blinkon200-blinkoff200

set number
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
set splitbelow
set splitright

""""""""""""""""
" File Searching
""""""""""""""""
silent! !git rev-parse --is-inside-work-tree
if v:shell_error == 0
    nnoremap <C-p> :GFiles<CR>
else
    nnoremap <C-p> :Files<CR>
endif

let g:fzf_layout = {'down': '~20%'}
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

""""""""""
" Settings
""""""""""
exe 'source' '~/.config/nvim/settings/coc.vim'
exe 'source' '~/.config/nvim/settings/vim-go.vim'

""""""""
" golang
""""""""
autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

