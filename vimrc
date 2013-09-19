set shell=/bin/bash
set nocompatible               " be iMproved
filetype off                   " required!
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required!
  Bundle 'gmarik/vundle'

" My Bundles here:
"

" Misc/unknown use
  Bundle 'vim-scripts/L9'

" Vim Improvements
  Bundle 'scrooloose/nerdtree'
  Bundle 'scrooloose/nerdcommenter'
  "Bundle 'Lokaltog/vim-powerline'
  Bundle 'bling/vim-airline'
  Bundle 'SirVer/ultisnips'
  Bundle 'tpope/vim-surround'
  Bundle 'YankRing.vim'
  Bundle 'mileszs/ack.vim'
  Bundle 'vim-scripts/ZoomWin'
  Bundle 'ervandew/supertab'
  Bundle 'vim-scripts/Gundo'
  Bundle 'chrisbra/NrrwRgn'
  Bundle 'tmhedberg/matchit'
  Bundle 'Townk/vim-autoclose'
  Bundle 'vim-scripts/scratch.vim'
  Bundle 'kien/ctrlp.vim.git'
  Bundle 'vim-scripts/Align'
  Bundle 'int3/vim-taglist-plus'

" Syntaxes
  Bundle 'php.vim'
  Bundle 'scrooloose/syntastic'
  Bundle 'vim-scripts/httplog'
  Bundle 'plasticboy/vim-markdown'
  Bundle 'aliva/vim-fish'
  Bundle 'tpope/vim-rails.git'
  Bundle 'tpope/vim-haml'
  Bundle 'slim-template/vim-slim'
  Bundle 'mattn/webapi-vim'
  Bundle 'jeyb/vim-jst'
  Bundle 'vim-scripts/JSON.vim'
  Bundle 't9md/vim-chef'
  Bundle 'nono/vim-handlebars'
  Bundle 'rodjek/vim-puppet'

" Git/github related
  Bundle 'git.zip'
  Bundle 'tpope/vim-fugitive'
  Bundle 'mattn/gist-vim'

" Color schemes
  Bundle 'tomasr/molokai'
  Bundle 'geetarista/ego.vim'
  Bundle 'matthewtodd/vim-twilight'

" Html/CSS/Templating
  Bundle 'mattn/emmet-vim'
  Bundle 'miripiruni/CSScomb-for-Vim'
  Bundle 'othree/html5.vim'
  Bundle 'beyondwords/vim-twig'

" Javascript
  Bundle 'JavaScript-Indent'
  Bundle 'JavaScript-syntax'
  Bundle 'ParseJSON'
  Bundle 'BufOnly.vim'
  Bundle 'kchmck/vim-coffee-script'

filetype plugin indent on     " required!
syntax enable

" Line numbers and indentation
set number
set mouse=a
set mousehide
set colorcolumn=80
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set autoindent
set smartindent
set ruler
" refresh buffer if file was change from outside
set autoread

" Better search options
set incsearch
set ignorecase
set smartcase
set gdefault
set showmatch
set hlsearch

" Basic options
set encoding=utf-8
set scrolloff=3
set hidden
set copyindent
set wildmenu
set wildmode=list:longest
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,docs/*     " MacOSX/Linux
set visualbell
set cursorline
set ttyfast
set ttymouse=xterm
set backspace=indent,eol,start
set laststatus=2
set virtualedit=all
set guifont=Monaco:h14
set nobackup " disable swapping
set noswapfile " disable swapping
set background=dark
set list
set listchars=tab:>.,trail:.,extends:#,nbsp:.
set nowrap
" How many tenths of a second to blink when matching brackets
set mat=2
set pt=<f12>

" Change mapleader
let mapleader = ","

" Set zen coding abbreviation expand key
let g:user_emmet_expandabbr_key = '<C-o>'
let g:user_emmet_mode = 'a'

" Show all files in NERDTree
let NERDTreeShowHidden = 1

" Choose right linter for syntastic
let g:syntastic_javascript_checkers=['gjslint']


" *****************************
" remapping function keys
" *****************************


" yankring toggle
noremap <silent> <F3> :YRShow<cr>

" Narrow region
vnoremap <F4> :NR<CR>

" Turn ctrl-p on/off
nnoremap <F1> :NERDTreeToggle<CR>

" Turn Gundo on/off
nnoremap <F2> :GundoToggle<CR>

" Switch betwee relative and absolute line numbers
nnoremap <F6> :call NumberToggle()<CR>

" Open scratch buffer
nnoremap <F10> :Scratch<CR>

" Split lines at cursor
nnoremap K i<CR><Esc>

nnoremap K i<CR><Esc>
" Close buffer and leave window open
nnoremap <leader>bo :BufOnly<CR>

" remap : to ;
nnoremap ; :

" Create vertical split
nnoremap <leader>w <C-w>v<C-w>l

" quickly open .vimrc
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
" source .vimrc
nmap <leader>sv :so $MYVIMRC<CR>

nnoremap <leader>t :CtrlP<CR>

"**************
"Movement
"**************

" navigating the splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" remap % to tab key
nnoremap <tab> %
vnoremap <tab> %

" remap escape to jj
inoremap jj <ESC>

" disable arrow keys for everything
" but insert mode
nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
vnoremap <up> <nop>
vnoremap <down> <nop>
vnoremap <left> <nop>
vnoremap <right> <nop>
nnoremap j gj
nnoremap k gk

" Taming search
nnoremap / /\v
vnoremap / /\v
nnoremap <C-i> /\v
vnoremap <C-i> /\v


" Dismiss search highlight
nnoremap <leader><space> :noh<cr>

" Yank to system clipboard as well
noremap y "*y
noremap yy "*Y
noremap Y "*y$


"nerdtree on/off
nmap <silent> <leader>m :NERDTreeFocus<cr>
nnoremap <f5> vi{ :CSScomb<cr>
vnoremap <f5> vi{ :CSScomb<cr>

" fix vim's idiotic indentation
vnoremap > ><cr>gv
vnoremap < <<cr>gv

" Set indentation for files
autocmd FileType css,sass,scss setlocal ai sw=2 sts=2 et

" Vim doesn't set a FileType for slim, so we'll do it manually:
autocmd BufNewFile,BufReadPost *.slim setlocal filetype=slim

" Vim doesn't set a FileType for JSON, so we'll do it manually:
autocmd BufNewFile,BufReadPost *.json setlocal filetype=javascript.json

" Requires that you have Python v2.6+ installed. (Most *nix systems do.)
autocmd FileType json let b:vimpipe_command="python -m json.tool"

" Strip white space at the end of line
autocmd BufWritePre * :%s/\s\+$//e

" Set syntax to jst for ejs files
au BufNewFile,BufRead *.ejs set filetype=jst

" Markdown
au BufRead *.md set ft=markdown


" Set omnicomplete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP

" Remove scrollbars
set guioptions-=L
set guioptions-=r

"colors
colorscheme twilight

function! NumberToggle()
  if(&relativenumber == 1)
    set number
  else
    set relativenumber
  endif
endfunc

" tweak cursor line
augroup CursorLine
  au!
  au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
  au WinLeave * setlocal nocursorline
augroup END

" Don't close window, when deleting a buffer
command! Bclose call <SID>BufcloseCloseIt()

function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Change ruler color
highlight ColorColumn ctermbg=Black

let g:UltisnipsSnippetsDir='snippets/'

"Airline customization

let g:airline_symbols= {}

let g:airline_right_sep = '◀'
let g:airline_left_sep = '▶'
let g:airlline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
