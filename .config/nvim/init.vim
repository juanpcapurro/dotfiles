set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
"Capurro's vimrc
execute pathogen#infect()
call pathogen#helptags()

let mapleader = ";"
let localleader = ";"

set wrap lbr
set relativenumber
set number
set numberwidth=1
set foldmethod=syntax
set foldlevelstart=0
set mouse=a
syntax on 
colorscheme gruvbox
filetype indent on
filetype plugin on 

set wildmenu
let g:gruvbox_contrast_dark="hard"
let g:airline#extensions#tabline#enabled = 1
set incsearch
set hlsearch
set background=dark
set cursorline
let g:auto_save = 1
set autowriteall
let g:livepreview_previewer = 'zathura'

"Indenting
set autoindent
set smartindent
set expandtab
set tabstop=4
set softtabstop=4
set shiftwidth=4

nnoremap <leader><space> :nohlsearch <CR>

"Use of system clipboard
set clipboard=unnamedplus

let g:markdown_enable_folding = 1

"specific commands by filetype
augroup cfggroup
    autocmd!
    autocmd FileType ruby setlocal tabstop=2
    autocmd FileType ruby setlocal shiftwidth=2
    autocmd FileType ruby setlocal softtabstop=2
    autocmd BufEnter *.js setlocal tabstop=2
    autocmd BufEnter *.js setlocal shiftwidth=2
    autocmd BufEnter *.js setlocal softtabstop=2
    autocmd BufEnter *.html setlocal tabstop=2
    autocmd BufEnter *.html setlocal shiftwidth=2
    autocmd BufEnter *.html setlocal softtabstop=2
augroup END

"visual navigation
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk
nnoremap B ^
nnoremap E $
nnoremap H g^
nnoremap L g$
vnoremap H g^
vnoremap L g$

nnoremap gV `[v`]

"Navigation of splits
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l
nnoremap <c-h> <c-w>h
nnoremap tt :tab split <CR>

"CommandT
set wildignore+=*.class,.git,.hg,.svn,target/**

inoremap <c-u> <esc>bveUA
nnoremap <c-u> bveU
nnoremap <leader>o o<esc>
nnoremap <leader>O O<esc>
nnoremap <leader>ev :tabnew $MYVIMRC<cr>
nnoremap <leader>ez :tabnew ~/.zshrc<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>
vnoremap <leader>/ <esc>'<O/*<esc>'>o*/<esc>
nnoremap <leader>nt d0i<tab>def ""(){<cr>}<esc>k0wwa
nnoremap <leader>f :NERDTreeToggle<cr>
inoremap jk <esc>
nnoremap <space> za

"EasyGrep
let g:EasyGrepMode=2
let g:EasyGrepCommand=0
let g:EasyGrepRecursive=1
let g:EasyGrepIgnoreCase=1

"MRU
cnoreabbrev mru MRU
cnoreabbrev mks mksession!

"Tabularize
cnoreabbrev tab Tabularize /

noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>

iabbrev ssig <cr>---<cr>Saludos, Juan Pablo.

autocmd VimEnter * echo ">^.^<"

"Markdown goodness
autocmd BufNewFile,BufRead *.md set filetype=markdown
let g:markdown_mapping_switch_status = '<leader>cm'
let g:markdown_enable_spell_checking = 0

"Terminal mode
:tnoremap <Esc> <C-\><C-n>
:tnoremap jk <C-\><C-n>
