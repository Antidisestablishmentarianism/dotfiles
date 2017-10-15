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

set hlsearch
set incsearch
set ignorecase
set smartcase
set showmatch

set showmode

call vundle#begin()

Plugin 'gmarik/vundle'
Plugin 'Yggdroot/indentLine'
Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'
Plugin 'Raimondi/delimitMate'

call vundle#end()

call pathogen#infect()

syntax enable
colorscheme automation

set laststatus=2
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\

autocmd filetype crontab setlocal nobackup nowritebackup

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

" Jump to next <++> marker
autocmd FileType html inoremap ;; <Esc>/<++><Enter>"_c4l
autocmd FileType html inoremap ;all <Esc>:%s/<++>//g<Enter>i

" HTML macros
autocmd FileType html inoremap ;com <!--  --><Enter><Enter><++><Esc>2kF!4li
autocmd FileType html inoremap ;em <em></em><Space><++><Esc>FeT>i
autocmd FileType html inoremap ;b <b></b><Space><++><Esc>FbT>i
autocmd FileType html inoremap ;u <u></u><Space><++><Esc>FuT>i
autocmd FileType html inoremap ;p <p></p><Enter><Enter><++><Esc>2k$FpT>i
autocmd FileType html inoremap ;h1 <h1></h1><Enter><Enter><++><Esc>2k$FhT>i
autocmd FileType html inoremap ;h2 <h2></h2><Enter><Enter><++><Esc>2k$FhT>i
autocmd FileType html inoremap ;h3 <h3></h3><Enter><Enter><++><Esc>2k$FhT>i
autocmd FileType html inoremap ;h4 <h4></h4><Enter><Enter><++><Esc>2k$FhT>i
autocmd FileType html inoremap ;h5 <h5></h5><Enter><Enter><++><Esc>2k$FhT>i
autocmd FileType html inoremap ;h6 <h6></h6><Enter><Enter><++><Esc>2k$FhT>i
autocmd FileType html inoremap ;a <a href=""><++></a><Space><++><Esc>Fh2t"li
autocmd FileType html inoremap ;img <img src=""><Space><++><Esc>Fs2t"li
autocmd FileType html inoremap ;br <br><Enter><Enter>
autocmd FileType html inoremap ;hr <hr><Enter><Enter>
autocmd FileType html inoremap ;div <div><Enter><++><Enter></div><Enter><++><Esc>3k/<++><Enter>"_c4l
autocmd FileType html inoremap ;html <html><Enter><++><Enter></html><Esc>3k/<++><Enter>"_c4l
autocmd FileType html inoremap ;head <head><Enter><++><Enter></head><Enter><++><Esc>3k/<++><Enter>"_c4l
autocmd FileType html inoremap ;body <body><Enter><++><Enter></body><Enter><++><Esc>3k/<++><Enter>"_c4l
autocmd FileType html inoremap ;title <title><Enter><++><Enter></title><Enter><++><Esc>3k/<++><Enter>"_c4l
autocmd FileType html inoremap ;type <!DOCTYPE html><Enter><Enter>
autocmd FileType html inoremap ;ul <ul><Enter><++><Enter></ul><Enter><++><Esc>3k/<++><Enter>"_c4l
autocmd FileType html inoremap ;ol <ol><Enter><++><Enter></ol><Enter><++><Esc>3k/<++><Enter>"_c4l
autocmd FileType html inoremap ;li <li></li><Enter><++><Esc>k$FlT>i
autocmd FileType html inoremap ;code <code></code><Space><++><Esc>FcT>i
autocmd FileType html inoremap ;meta <meta<Space>><Enter><++><Esc>k$i
autocmd FileType html inoremap ;pre <pre></pre><Enter><Enter><++><Esc>2k$FpT>i
