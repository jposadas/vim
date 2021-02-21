let g:ale_disable_lsp = 1

""""""""""""""""
" Plugin Section
""""""""""""""""
call plug#begin('~/.vim/plugged')

Plug 'itchyny/lightline.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'}
Plug 'junegunn/fzf.vim'
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'fatih/vim-go', {'do': ':GoUpdateBinaries'}
Plug 'iloginow/vim-stylus'
Plug 'mattn/calendar-vim'
Plug 'vimwiki/vimwiki', {'branch': 'dev'}
Plug 'arcticicestudio/nord-vim'
Plug 'gruvbox-community/gruvbox'
Plug 'iamcco/markdown-preview.nvim', {'do': 'cd app && yarn install'}
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'nvim-treesitter/playground'

Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'

call plug#end()

""""""""""""""""
" Config Section
""""""""""""""""
if (has("termguicolors"))
    set termguicolors
endif

syntax on
filetype plugin on
colorscheme nord

set nocompatible
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
set noshowmode
set signcolumn=number

set colorcolumn=80
highlight ColorColumn ctermbg=lightgrey guibg=#2d323d

nnoremap <SPACE> <Nop>
let mapleader=" "

""""""""""
" Settings
""""""""""
exe 'source' '~/.config/nvim/settings/fzf.vim'
exe 'source' '~/.config/nvim/settings/vim-lightline.vim'
" exe 'source' '~/.config/nvim/settings/coc.vim'
exe 'source' '~/.config/nvim/settings/vim-go.vim'
exe 'source' '~/.config/nvim/settings/vimwiki.vim'

""""""""
" golang
""""""""
" autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')

"""""""""""""
" tree-sitter
"""""""""""""

lua <<EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true
    },
    playground = {
        enable = true
    }
}
EOF

"""""
" lsp
"""""
lua require('lsp')


""""""""""""
" completion
""""""""""""
set completeopt=menuone,noinsert
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
