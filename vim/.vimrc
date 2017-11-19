set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'vim-scripts/ReplaceWithRegister'
Plugin 'w0rp/ale'
Plugin 'mattn/emmet-vim'
Plugin 'junegunn/fzf.vim'
Plugin 'sjl/gundo.vim'
Plugin 'itchyny/lightline.vim'
Plugin 'taohex/lightline-buffer'
Plugin 'scrooloose/nerdtree'
Plugin 'tomtom/tlib_vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'altercation/vim-colors-solarized'
Plugin 'dodie/vim-disapprove-deep-indentation'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-surround'
Plugin 'Valloric/MatchTagAlways'
Plugin 'vim-scripts/tComment'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'pangloss/vim-javascript'
call vundle#end()

set showcmd
set noshowmode

filetype on
filetype plugin indent on
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
set showtabline=2 " Always show tabline
set nocompatible
set laststatus=2
set cursorline
set cursorcolumn

if !has('gui_running')
  set t_Co=256
endif

filetype indent on
set lazyredraw
set showmatch

set relativenumber
set number

set grepprg=rg\ --vimgrep
set rtp+=/usr/local/opt/fzf

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
map <leader>o :NERDTreeToggle<CR>

nnoremap <leader>bq :bp <BAR> bd #<CR>
nnoremap <leader>wq :w<CR>:bd<CR>
nnoremap <leader>wQ :w<CR>:bd<CR>:q<CR>

nnoremap <leader>vsp :vsp<CR>
nnoremap <leader>sp :sp<CR>

nnoremap gl :bn<CR>
nnoremap gh :bp<CR>
nnoremap gd :bd<CR>

set splitbelow
set splitright

" Split navigation
nnoremap <C-J> <C-W>j
nnoremap <C-K> <C-W>k
nnoremap <C-L> <C-W>l
nnoremap <C-H> <C-W>h

nnoremap <leader>f :Find
nnoremap <leader>t :Files
nnoremap <leader>r :History

let g:Powerline_symbols = 'fancy'
let g:numbers_exclude = ['unite', 'tagbar', 'startify', 'gundo', 'vimshell', 'w3m', 'nerdtree', 'minibuxexpl']
let g:LookOfDisapprovalTabTreshold=5
let g:LookOfDisapprovalSpaceTreshold=(&tabstop*5)
" use lightline-buffer in lightline
let g:lightline = {
    \ 'colorscheme': 'powerline',
    \ 'tabline': {
    \   'left': [ [ 'bufferinfo' ],
    \             [ 'separator' ],
    \             [ 'bufferbefore', 'buffercurrent', 'bufferafter' ], ],
    \   'right': [ [ 'close' ], ],
    \ },
    \ 'component_expand': {
    \   'buffercurrent': 'lightline#buffer#buffercurrent',
    \   'bufferbefore': 'lightline#buffer#bufferbefore',
    \   'bufferafter': 'lightline#buffer#bufferafter',
    \ },
    \ 'component_type': {
    \   'buffercurrent': 'tabsel',
    \   'bufferbefore': 'raw',
    \   'bufferafter': 'raw',
    \ },
    \ 'component_function': {
    \   'bufferinfo': 'lightline#buffer#bufferinfo',
    \ },
    \ 'component': {
    \   'separator': '',
    \ },
    \ }
" lightline-buffer ui settings
" replace these symbols with ascii characters if your environment does not support unicode
let g:lightline_buffer_logo = ' '
let g:lightline_buffer_readonly_icon = ''
let g:lightline_buffer_modified_icon = '✭'
let g:lightline_buffer_git_icon = ' '
let g:lightline_buffer_ellipsis_icon = '..'
let g:lightline_buffer_expand_left_icon = '◀ '
let g:lightline_buffer_expand_right_icon = ' ▶'
let g:lightline_buffer_active_buffer_left_icon = ''
let g:lightline_buffer_active_buffer_right_icon = ''
let g:lightline_buffer_separator_icon = '  '

" lightline-buffer function settings
let g:lightline_buffer_show_bufnr = 1
let g:lightline_buffer_rotate = 0
let g:lightline_buffer_fname_mod = ':t'
let g:lightline_buffer_excludes = ['vimfiler']

let g:lightline_buffer_maxflen = 30
let g:lightline_buffer_maxfextlen = 3
let g:lightline_buffer_minflen = 16
let g:lightline_buffer_minfextlen = 3
let g:lightline_buffer_reservelen = 20

let g:minimap_show='<leader>ms'
let g:minimap_update='<leader>mu'
let g:minimap_close='<leader>mc'
let g:minimap_toggle='<leader>mt'

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

" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options

command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>), 1, <bang>0)

" Bind F5 to save file if modified and execute python script in a buffer.
" Note: This is a normal mode bind because in insert mode F5 would insert a "<F5>" into the text.
nnoremap <silent> <F5> :<C-u>call SaveAndExecutePython()<CR>
