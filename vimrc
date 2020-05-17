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
set colorcolumn=80

" Indent 2 spaces
set tabstop=2
set shiftwidth=2
set softtabstop=2
set autoindent

syntax on

set mouse=a " allows the use of mouse

" mappings

 " jj as es
 inoremap jj <Esc>
 " clear highlight to K
 nnoremap K :let @/ = "" <Bar> <CR>
 " Y (yy) to y$ 
 nnoremap y$ yy
 " enter as esc in visual mode
 vnoremap <Return> <Esc>

 " leader remapping
 nnoremap <Space> <NOP>
 vnoremap <Space> <NOP>
 :let mapleader = "\<Space>"

 " toggle maximum char limit	
 function! ToggleC()
    if &cc == 0
        let &cc = 80
    else
        let &cc = 0
    endif
 endfunction
 nnoremap <Leader>l :call ToggleC()<CR>

" From github/samflattery
" --
" Make navigating wrapped lines the same as normal
 noremap <Silent> k gk
 noremap <Silent> j gj
 noremap <Silent> gk k
 noremap <Silent> gj j
 noremap <Silent> ^ g^
 noremap <Silent> g^ ^
 noremap <Silent> _ g_

 " Use tab to jump between blocks, because it's easier
 nnoremap <Tab> %
 vnoremap <Tab> %

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
Plugin 'junegunn/seoul256.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'unblevable/quick-scope'  
Plugin 'preservim/nerdtree'
Plugin 'dense-analysis/ale'
Plugin 'junegunn/goyo.vim'
Plugin 'preservim/nerdcommenter'

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

" -- Nerd Tree --
nnoremap <Leader>f :NERDTreeToggle<CR>

" -- Quickscope --
" Trigger a highlight only when pressing f, F, t, and T.
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']"
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
highlight QuickScopeSecondary guifg='#5fffff' gui=underline ctermfg=81 cterm=underline

" -- Ale --
let b:ale_fixers = {'sml': ['prettier', 'eslint']}

" -- Nerdcommenter --
" one space after every comment
let NERDSpaceDelims=1 
" remap + to commenting/uncommenting
vnoremap + :call NERDComment(0,"toggle")<CR> 
