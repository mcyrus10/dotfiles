set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'morhetz/gruvbox'
Plugin 'gilgigilgil/anderson.vim'
Plugin 'iamcco/markdown-preview.nvim'
Plugin 'rafi/awesome-vim-colorschemes'

call vundle#end()

"set background=dark
hi Normal ctermbg=NONE guibg=NONE
colorscheme seoul256

set foldmethod=marker


syntax on
set number relativenumber
set nu rnu 				" show line number and relative number?
set tabstop=4 			" tab size

set colorcolumn=80 		" line at column 80
set cursorline 			" higlight cursor line
set cursorcolumn 		" higlight cursor column
set hlsearch 			" ???

let vim_markdown_preview_github=1

" Unicode
scriptencoding utf-8
set encoding=utf-8
setglobal fileencoding=utf-8
