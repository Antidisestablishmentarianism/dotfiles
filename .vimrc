set nocompatible
filetype plugin on
filetype plugin indent on

let g:indent_guides_enable_on_vim_startup = 1 

let g:indentLine_setColors = 0
let g:indentLine_char = '┆'

let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsJumpForwardTrigger="<C-j>"
let g:UltiSnipsJumpBackwardTrigger="<C-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips","vim-snippets"]
let delimitMate_expand_cr = 1

set rtp+=~/.vim/bundle/vundle

set backspace=2
set laststatus=2
set t_Co=256

set tabstop=4
set softtabstop=4
set shiftwidth=4
set autoindent
set smartindent
set number
set hidden

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

set showmode

set listchars=tab:▸\ ,eol:¬

call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'Yggdroot/indentLine'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate'
Plugin 'scrooloose/nerdtree'

call vundle#end()

call pathogen#infect()

syntax enable
colorscheme automation

set laststatus=2
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\

" Disable arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
noremap <Down> :echoe "Use j"<CR>

" Keep cursor in center of screen
nnoremap j jzz
nnoremap k kzz

" Insert newline without entering insert mode
nmap <S-Enter> O<Esc>
nmap <CR> o<Esc>

" Keep highlight when indenting in visual mode
vmap > >gv
vmap < <gv

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

" Open window below instead of above
nnoremap <C-W>N :let sb=&sb<BAR>set sb<BAR>new<BAR>let &sb=sb<CR>

" Toggle indent and newline hidden characters
nnoremap <C-l> :set list!<Enter>

command Test :!ptest<Space>-f<Space>%<Space>-k
