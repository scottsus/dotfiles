syntax on

set number
set tabstop=2
set expandtab
set autoindent
set smartindent
set showmatch
set matchpairs+=<:>
set belloff=all

" use system clipboard
set clipboard=unnamed

" insert mode mappings
inoremap jk <Esc>

" normal mode mappings
nnoremap H ^
nnoremap L $
nnoremap J }
nnoremap K {
nnoremap zz z.
nnoremap dw vaw"_d
nnoremap d "_d
nnoremap dd "_dd
nnoremap ct "_ct
nnoremap x "_x
nnoremap p "_p
nnoremap viw viwy

" VIM plug
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/plugged')

Plug 'sainnhe/sonokai'

call plug#end()

" Colorschemes
colorscheme sonokai
