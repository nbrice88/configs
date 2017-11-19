execute pathogen#infect()

set showcmd
set showmode

filetype on
filetype plugin on
syntax on

set autoindent

set expandtab
set smarttab

set shiftwidth=2
set tabstop=2
set softtabstop =2

set wildmenu
set wildmode=list:longest,full

set ttymouse=xterm2
set mouse=a

set backspace=2

set ruler

set ignorecase

set smartcase

set incsearch
set hlsearch
set hidden

set nocompatible
set laststatus=2
set cursorline

filetype indent on
set lazyredraw
set showmatch

set relativenumber
set number

inoremap jj <Esc>

nmap j gj
vmap j gj
nmap k gk
vmap k gk
nmap 0 g0
vmap 0 g0
nmap $ g$
vmap $ g$

noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

" Y should work like D
map Y y$

" copy/past to clipboard
vmap <C-x> :!pbconpy<CR>
vmap <C-c> :w !pbcopy<CR><CR>
nmap <C-v> :r !pbpaste<CR><esc>
imap <C-v> <esc> :r !pbpaste<CR> i

nmap n nzz
nmap N Nzz

nmap zj o<Esc>k
nmap zk O<Esc>j

" leader mappings
" turn off search highlighting
let mapleader="\<space>"
nnoremap <leader>/ :set hlsearch! hlsearch?<CR>
nnoremap <leader>u :GundoToggle<CR>
nnoremap <leader><space> i<space><esc>l
nnoremap <leader>j 15j
nnoremap <leader>k 15k
" delete without yanking
nnoremap <leader>d "_d
vnoremap <leader>d "_d
" replace currently selected text with default register
" without yanking
vnoremap <leader>p "_dP
map <leader>n :NERDTreeToggle<CR>

nnoremap <leader>bq :bp <BAR> bd #<CR>
nnoremap <leader>wq :w<CR>:bd<CR>
nnoremap <leader>wQ :w<CR>:bd<CR>:q<CR>

nnoremap <leader>vsp :vsp<CR>
nnoremap <leader>sp :sp<CR>

nnoremap <leader>l :bn<CR>
nnoremap <leader>h :bp<CR>

nnoremap <leader>c V

set splitbelow
set splitright

" Split navigation
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

let g:Powerline_symbols = 'fancy'
let g:numbers_exclude = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'nerdtree', 'minibuxexpl']
let g:LookOfDisapprovalTabTreshold=5
let g:LookOfDisapprovalSpaceTreshold=(&tabstop*5)

" Nerdtree stuff
let NERDTreeShowHidden=1      " show hidden files
let NERDTreeQuitOnOpen = 1    " Hide NERDTree when opening a file
let NERDTreeShowLineNumbers=1 " enable line numbers

" make sure relative line numbers are used
autocmd FileType nerdtree setlocal relativenumber
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

function! SaveAndExecutePython()
  " SOURCE [reusable window]: https://github.com/fatih/vim-go/blob/master/autoload/go/ui.vim

  " save and reload the current file
  silent execute "update | edit"

  " get file path of current file
  let s:current_buffer_file_path = expand("%")

  let s:output_buffer_name = "Python"
  let s:output_buffer_filetype = "output"

  " reuse existing buffer window if it exists otherwise create a new one
  if !exists("s:buf_nr") || !bufexists(s:buf_nr)
    silent execute 'botright new ' . s:output_buffer_name
    let s:buf_nr = bufnr('%')
  elseif bufwinnr(s:buf_nr) == -1
    silent execute 'botright new'
    silent execute s:buf_nr . 'buffer'
  elseif bufwinnr(s:buf_nr) != bufwinnr('%')
    silent execute bufwinnr(s:buf_nr) . 'wincmd w'
  endif

  silent execute "setlocal filetype=" . s:output_buffer_filetype
  setlocal bufhidden=delete
  setlocal buftype=nofile
  setlocal noswapfile
  setlocal nobuflisted
  setlocal winfixheight
  setlocal cursorline " make it easy to distinguish
  setlocal nonumber
  setlocal norelativenumber
  setlocal showbreak=""

  " clear the buffer
  setlocal noreadonly
  setlocal modifiable
  %delete _

  " add the console output
  silent execute ".!python " . shellescape(s:current_buffer_file_path, 1)

  " resize window to content length
  " Note: This is annoying because if you print a lot of lines then your code buffer is forced to a height of one line every time you run this function.
  "       However without this line the buffer starts off as a default size and if you resize the buffer then it keeps that custom size after repeated runs of this function.
  "       But if you close the output buffer then it returns to using the default size when its recreated
  "execute 'resize' . line('$')

  " make the buffer non modifiable
  setlocal readonly
  setlocal nomodifiable
endfunction

" Bind F5 to save file if modified and execute python script in a buffer.
" Note: This is a normal mode bind because in insert mode F5 would insert a "<F5>" into the text.
nnoremap <silent> <F5> :<C-u>call SaveAndExecutePython()<CR>
