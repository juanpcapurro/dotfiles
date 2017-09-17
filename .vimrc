"Capurro's vimrc
execute pathogen#infect()
call pathogen#helptags()

let mapleader = ";"
let localleader = ";"

set wrap lbr
set number
set numberwidth=1

"Indenting
set autoindent
set smartindent
set expandtab
set tabstop=4
set shiftwidth=4

"Use of system clipboard
set clipboard=unnamedplus

"Markdown highlight

autocmd BufNewFile,BufFilePre,BufRead *.md set filetype=markdown.pandoc

"visual navigation
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap H ^
nnoremap L $

"Navigation of splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h

"CommandT
set wildignore+=*.class,.git,.hg,.svn,target/**

inoremap <c-u> <esc>bveUA
nnoremap <c-u> bveU
nnoremap <leader>o o<esc>k
nnoremap <leader>O O<esc>j
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
vnoremap <leader>/ <esc>'<O/*<esc>'>o*/<esc>
nnoremap <leader>nt d0i<tab>def ""(){<cr>}<esc>k0wwa
nnoremap <leader>f :NERDTreeTabsToggle<cr>
inoremap jk <esc>

"EasyGrep
let g:EasyGrepMode=2
let g:EasyGrepCommand=0
let g:EasyGrepRecursive=1
let g:EasyGrepIgnoreCase=1

"MRU
cnoreabbrev mru MRU

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

iabbrev ssig <cr>---<cr>Saludos, Juan Pablo.

autocmd VimEnter * echo ">^.^<"
