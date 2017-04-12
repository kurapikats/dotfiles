set shell=/bin/bash

set ttyfast
set lazyredraw

if has("autocmd")
  au VimEnter,InsertLeave * silent execute '!echo -ne "\e[2 q"' | redraw!
  au InsertEnter,InsertChange *
    \ if v:insertmode == 'i' | 
    \   silent execute '!echo -ne "\e[6 q"' | redraw! |
    \ elseif v:insertmode == 'r' |
    \   silent execute '!echo -ne "\e[4 q"' | redraw! |
    \ endif
  au VimLeave * silent execute '!echo -ne "\e[ q"' | redraw!
endif

syntax on
colors elflord

set nocompatible
set nobackup
set nowritebackup
set rnu " Set relative line numbering
set autoindent
set backspace=indent,eol,start
set ruler
set nohlsearch
set laststatus=2
set ignorecase smartcase
set noswapfile
set incsearch " do incremental searching
set showcmd " display incomplete commands
set autowrite " Automatically :write before commands

set textwidth=80
set colorcolumn=+1

" Autocomplete with dictionary words when spell check is on
set complete+=kspell

set number
set numberwidth=5

" Softtabs, 2 spaces 
set expandtab
set shiftwidth=2
set softtabstop=2
set shiftround
set tabstop=2

" Display extra whitespace
set list listchars=tab:»·,trail:·,nbsp:·

" inoremap jj <ESC> 
execute pathogen#infect()
filetype plugin indent on

" for syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" for ctrl-p
set runtimepath^=~/.vim/bundle/ctrlp.vim

" for javascript-libraries-syntax
" let g:used_javascript_libs = 'jquery,react'
" autocmd BufReadPre *.js let b:javascript_lib_use_jquery = 1
" autocmd BufReadPre *.jsx let b:javascript_lib_use_react = 1

" have jsx highlighting/indenting work in .js files as well
let g:jsx_ext_required = 0

" for NERDTree, auto show tree when no file loaded
" map toogle
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
map <C-b> :NERDTreeToggle<CR>

" Toggle nerdtree with F10
" map <F10> :NERDTreeToggle<CR>
" Current file in nerdtree
" map <F9> :NERDTreeFind<CR>

" Reduce timeout after <ESC> is recieved.
set ttimeout
set ttimeoutlen=20
set notimeout

let g:jsx_ext_required = 0
" let g:xml_syntax_folding = 1

" ignore these files, directories on ctrl+p fuzzy searching
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|meteor'

" provide hjkl movements in Insert mode via the <Alt> modifier key
inoremap <A-h> <C-o>h
inoremap <A-j> <C-o>j
inoremap <A-k> <C-o>k
inoremap <A-l> <C-o>l
inoremap <A-b> <C-o>b
inoremap <A-w> <C-o>w

" Get off my lawn
nnoremap <Left> :echoe "Use h"<CR>
nnoremap <Right> :echoe "Use l"<CR>
nnoremap <Up> :echoe "Use k"<CR>
nnoremap <Down> :echoe "Use j"<CR>

" Persistent undo
set undodir=~/.vim/undo/
set undofile
set undolevels=1000
set undoreload=10000

" Treat <li> and <p> tags like the block tags they are
let g:html_indent_tags = 'li\|p'

" Open new split panes to right and bottom, which feels more natural
set splitbelow
set splitright

" Quicker window movement. Seemlessly navigate between Vim/Tmux panes
let g:tmux_navigator_no_mappings = 1
