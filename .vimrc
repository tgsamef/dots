" http://github.com/tgsamef  ___
"                          /'___\
" same-f [.dotfiles]      /\ \__/
"  ___  __ _ _ __ ___   __\ \ ,__\
" / __|/ _` | '_ ` _ \ / _ \ \ \_/
" \__ \ (_| | | | | | |  __/\ \ \
" |___/\__,_|_| |_| |_|\___| \/_/
"______________________________________
" .vimrc config 

set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'frazrepo/vim-rainbow'
    Plugin 'ryanoasis/vim-devicons'
    Plugin 'scrooloose/nerdtree', {'on': 'NERDTreeToggle'}
    Plugin 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plugin 'tpope/vim-surround'
    Plugin 'tpope/vim-commentary'
    Plugin 'PotatoesMaster/i3-vim-syntax'
    Plugin 'vim-python/python-syntax'
    Plugin 'ap/vim-css-color'
    Plugin 'w0rp/ale'
    Plugin 'kaicataldo/material.vim'
    Plugin 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}
    Plugin 'romkatv/powerlevel10k'
    Plugin 'itchyny/lightline.vim'
    Plugin 'maralla/completor.vim'
    Plugin 'editorconfig/editorconfig-vim'
    Plugin 'junegunn/limelight.vim'
call vundle#end()
filetype plugin indent on

set rtp+=/usr/lib/python3.10/site-packages/powerline/bindings/vim

" general
syntax on
colorscheme material
set wildmenu
set incsearch
set hidden
set nobackup
set noswapfile
set t_Co=256
set number
set clipboard=unnamedplus
set guioptions-=mrL
set cindent
set smartindent
set autoindent
set complete+=s
set tabpagemax=20
set expandtab
set smarttab
set shiftwidth=4
set tabstop=4
let g:rehash256=1
let mapleader="'"

let g:material_terminal_italics=1
let g:material_theme_style='darker'

" statusline
let g:lightline = {
            \ 'colorscheme': 'material_vim',
            \ }
set laststatus=2
set noshowmode

" nerdtree
map <C-n> :NERDTreeToggle<CR>
let NERDTreeShowLineNumbers=1
let NERDTreeShowHidden=1
let NERDTreeMinimalUI=1
let g:NERDTreeWinSize=24

python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup
