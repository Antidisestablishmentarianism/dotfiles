let g:livepreview_previewer = 'evince'

set nocompatible

let g:indent_guides_enable_on_vim_startup = 1 

let g:indentLine_setColors = 0
let g:indentLine_char = '|'

let g:UltiSnipsListSnippets="<c-e>"
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<C-k>"
let g:UltiSnipsSnippetDirectories=["UltiSnips","vim-snippets"]
let delimitMate_expand_cr = 1
let g:ycm_global_ycm_extra_conf = '~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'

let g:livepreview_previewer = 'evince'

set backspace=2
set laststatus=2
set t_Co=256

set incsearch
set ignorecase
set smartcase
set showmatch

set showmode

set wildmenu
set wildmode=full

set listchars=tab:▸\ ,eol:¬

" Install vim plug if not installed already
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')

Plug 'gmarik/vundle'
Plug 'Yggdroot/indentLine'
Plug 'SirVer/ultisnips'
Plug 'flazz/vim-colorschemes'
Plug 'honza/vim-snippets'
Plug 'Raimondi/delimitMate'
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeToggle' }
Plug 'w0rp/ale'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'dodie/vim-disapprove-deep-indentation'
Plug 'sjl/gundo.vim', { 'on': 'GundoToggle' }
Plug 'xuhdev/vim-latex-live-preview'
Plug 'Shougo/vimproc.vim', { 'do': 'make' }
Plug 'idanarye/vim-vebugger'
Plug 'pangloss/vim-javascript'
Plug 'Valloric/YouCompleteMe'
Plug 'sjl/gundo.vim'
Plug 'dylanaraps/wal'
Plug 'xuhdev/vim-latex-live-preview'

call plug#end()

call pathogen#infect()

syntax enable
set background=dark
let g:solarized_termtrans=1
colorscheme wal

set laststatus=2
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\

let mapleader = " "

" Disable arrow keys
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

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
map <leader>n :NERDTreeToggle<CR>

" Open window below instead of above
nnoremap <C-W>N :let sb=&sb<BAR>set sb<BAR>new<BAR>let &sb=sb<CR>

" Toggle gundo
nnoremap <leader>g :GundoToggle<CR>

" Toggle indent and newline hidden characters
nnoremap <leader>p :set list!<CR>

" Bind ejs to html for syntax highlighting
au BufNewFile,BufRead *.ejs set filetype=html

" Make multi-windows easier to use
nnoremap <leader>w <C-w>
nnoremap <leader>h <C-w>h
nnoremap <leader>j <C-w>j
nnoremap <leader>k <C-w>k
nnoremap <leader>l <C-w>l

" When you try to close too fast
command! Wq wq

" Tab settings
set tabstop=2
set softtabstop=0
set shiftwidth=2
set expandtab
set smarttab
set autoindent
set smartindent
set number
set relativenumber
set hidden
autocmd FileType java setlocal autoindent si tabstop=4 shiftwidth=4 cinoptions+=j1
autocmd FileType html setlocal ts=2 sw=2 expandtab

function! g:UltiSnips_Complete()
  call UltiSnips#ExpandSnippet()
  if g:ulti_expand_res == 0
    if pumvisible()
      return "\<C-n>"
    else
      call UltiSnips#JumpForwards()
      if g:ulti_jump_forwards_res == 0
        return "\<TAB>"
      endif
    endif
  endif
  return ""
endfunction

function! g:UltiSnips_Reverse()
  call UltiSnips#JumpBackwards()
  if g:ulti_jump_backwards_res == 0
    return "\<C-P>"
  endif

  return ""
endfunction

if !exists("g:UltiSnipsJumpForwardTrigger")
  let g:UltiSnipsJumpForwardTrigger = "<tab>"
endif

if !exists("g:UltiSnipsJumpBackwardTrigger")
  let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
endif

au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsExpandTrigger . " <C-R>=g:UltiSnips_Complete()<cr>"
au InsertEnter * exec "inoremap <silent> " . g:UltiSnipsJumpBackwardTrigger . " <C-R>=g:UltiSnips_Reverse()<cr>"
