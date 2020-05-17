" for system-wide .vimrc
set nocompatible

" --- General settings ---
set backspace=indent,eol,start
set ruler
set number
set showcmd
set incsearch
set hlsearch
set showmatch " skipping matching parens
set matchtime=3 " time for matching paren
set wildignore+=.pyc,.swp " ignore swp files
set wildmenu " autocomplete/suggestions

" Indent 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

syntax on

set mouse=a


" mappings

 " jj as es
 inoremap jj <Esc>
 " clear highlight to K
 nnoremap K :let @/ = "" <bar> <CR>
 " Y (yy) to y$ 
 nnoremap y$ yy
 " commenting and uncommenting
 vnoremap + :norm i
 vnoremap - :norm dw <bar> <CR>
 " enter as esc in visual mode
 vnoremap <Return> <Esc>

 " leader mapping
 nnoremap <Space> <NOP>
 vnoremap <Space> <NOP>
 :let mapleader = "\<Space>"
 " nerd tree mappings
 nmap <Leader>f :NERDTreeToggle<CR>

" From samflattery
" --
" Make navigating wrapped lines the same as normal
 noremap <silent> k gk
 noremap <silent> j gj
 noremap <silent> gk k
 noremap <silent> gj j
 noremap <silent> ^ g^
 noremap <silent> g^ ^
 noremap <silent> _ g_

 " Use tab to jump between blocks, because it's easier
 nnoremap <tab> %
 vnoremap <tab> %

" Make vim open where left off
" if has("autocmd")
"   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
"   \| exe "normal! g'\"" | endif
" endif
" --

" needed for vundle
filetype off 

" --- Vundle ---
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" ----- Vim Plugins --------
Plugin 'altercation/vim-colors-solarized'
Plugin 'tyrannicaltoucan/vim-deep-space'
Plugin 'mhartington/oceanic-next'
Plugin 'junegunn/seoul256.vim'
Plugin 'tomasr/molokai'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'unblevable/quick-scope'  
Plugin 'preservim/nerdtree'
Plugin 'dense-analysis/ale'
Plugin 'junegunn/goyo.vim'

call vundle#end()

filetype plugin indent on

" ---- Plugin-Specific Settings ----

" --- Themes ---
set t_Co=256

" -- vim theme: seoul256 (dark) --
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237
let g:seoul256_background = 235
colo seoul256

" -- vim-airline settings --
" show statusbar
set laststatus=2

let g:airline_powerline_fonts = 1

" Show PASTE if in paste mode
let g:airline_detect_paste=1

" Show airline for tabs too
let g:airline#extensions#tabline#enabled = 1

let g:airline_theme='base16'

" --- Plugin configs ---
" -- Quickscope --
" Trigger a highlight only when pressing f, F, t, and T.
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']"
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

" -- Ale --
let b:ale_fixers = {'sml': ['prettier', 'eslint']}
