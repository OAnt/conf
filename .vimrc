set nocompatible
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'jonathanfilip/vim-lucius'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'kien/ctrlp.vim'
Plugin 'valloric/youcompleteme'
call vundle#end()
filetype plugin indent on
syntax on
colorscheme lucius
set tabstop=8 expandtab shiftwidth=4 softtabstop=4
set number
set spell spelllang=en_us
"let g:ycm_use_clangd = 0
let g:ycm_autoclose_preview_window_after_insertion = 1
set tags=.tags
nnoremap <S-Tab> :tabn<CR>
nnoremap <C-n> :tabe<CR>
set backspace=indent,eol,start  " more powerful backspacing
