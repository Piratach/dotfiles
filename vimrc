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
set viminfo='100,<500,s100,h
" https://stackoverflow.com/questions/3676855/vim-limited-line-memory
" 100 Marks will be remembered for the last 100 edited files.
" <500 Limits the number of lines saved for each register to 500 lines; if a
"       register contains more than 1000 lines, only the first 500 lines are
"       saved.
" s100 Registers with more than 100 KB of text are skipped
" h Disables search highlighting when Vim starts.

" ---------------------------
" Default Config - indent 2 spaces, maximum char per line = 80
autocmd FileType * setlocal tabstop=2 shiftwidth=2 softtabstop=2 autoindent expandtab colorcolumn=80

" ---------------------------
" Language Specific Configs
" ---------------------------
" C++
" cpp files - indent 2 spaces, maximum char per line = 120
" Currently changed for the duration of the wunderpus project
autocmd FileType cpp setlocal tabstop=4 shiftwidth=4 softtabstop=4 autoindent expandtab colorcolumn=120
" clang-format (manually - ctrl+k)
map <C-k> :py3f /usr/local/Cellar/clang-format/11.0.0/share/clang/clang-format.py<CR>
" clang-format (on save), comment out if no clang-format
" TODO: this will fail on the very first save as file does not exist
" Current (bad) fix: add try/except to clang-format.py at the corresponding
" line
" function! Formatonsave()
  " let l:formatdiff = 1
  " " replace line below with where clang-format.py is located
  " py3f /usr/local/Cellar/clang-format/11.0.0/share/clang/clang-format.py
" endfunction
" autocmd BufWritePre *.h,*.cc,*.cpp call Formatonsave()
" ---------------------------
" Python
" py files - indent 4 spaces, maximum char per line = 80
autocmd FileType py setlocal tabstop=4 shiftwidth=4 softtabstop=4 autoindent colorcolumn=80
" ---------------------------
" C
" c files - indent 4 spaces, maximum char per line = 120
autocmd FileType c setlocal tabstop=4 shiftwidth=4 softtabstop=4 autoindent colorcolumn=120
" ---------------------------
" CUDA
" cu files - indent 4 spaces, maximum char per line = 120
autocmd FileType cu setlocal tabstop=4 shiftwidth=4 softtabstop=4 autoindent colorcolumn=120
" ---------------------------

" set tabstop=2
" set shiftwidth=2
" set softtabstop=2
" set autoindent
" set expandtab " tabs are spaces

syntax on

set mouse=a " allows the use of mouse

" mappings

 " jj as es
 inoremap jj <Esc>
 " clear highlight to K
 nnoremap & :let @/ = "" <Bar> <CR>
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
 nnoremap <Leader>k :call ToggleC()<CR>

" Toggle ALE signcolumn. Works only on vim>=8.0 or NeoVim
" https://stackoverflow.com/questions/18319284/vim-sign-column-toggle/18322752#18322752
function! ToggleSignColumn()
    if !exists("b:signcolumn_on") || b:signcolumn_on
        set signcolumn=no
        let b:signcolumn_on=0
    else
        set signcolumn=auto
        let b:signcolumn_on=1
    endif
endfunction

noremap <Leader>l :call ToggleSignColumn()<CR> 

 " Mac commands for copying to system's clipboard
 " Allows many more characters to be copied at once
 vnoremap <Leader>d :!pbcopy<CR>
 vnoremap <Leader>y :w !pbcopy<CR><CR>
 nnoremap <Leader>p :r !pbpaste<CR>

" Navigating wrapped lines while keeping  _j commands the same
 nnoremap <expr> j v:count ? (v:count > 5 ? "m'" . v:count : '') . 'j' : 'gj'
 nnoremap <expr> k v:count ? (v:count > 5 ? "m'" . v:count : '') . 'k' : 'gk'

" From github/samflattery
" --
" Make navigating wrapped lines the same as normal
 noremap ^ g^
 noremap g^ ^
 noremap _ g_

 " Use tab to jump between blocks, because it's easier
 nnoremap <Tab> %
 vnoremap <Tab> %

" Make vim open where left off
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
  \| exe "normal! g'\"" | endif
endif
" --

" needed for vundle
filetype off 

" --- Vundle ---
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" run vim +PluginInstall +qall from command line to install plugins
" or run :PluginInstall in vim
" ----- Vim Plugins --------
Plugin 'dense-analysis/ale'
Plugin 'edkolev/tmuxline.vim'
Plugin 'fatih/vim-go'
Plugin 'jez/vim-better-sml'
Plugin 'jez/vim-ispc'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/seoul256.vim'
Plugin 'lervag/vimtex'
Plugin 'preservim/nerdcommenter'
Plugin 'preservim/nerdtree'
Plugin 'unblevable/quick-scope'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

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

" Match tmux status bar with vim airline
let g:airline#extensions#tmuxline#enabled = 1
let airline#extensions#tmuxline#snapshot_file = "~/.tmux-status.conf"

" -- Nerd Tree --
nnoremap <Leader>f :NERDTreeToggle<CR>

map <S-l>  :bn<CR>
map <S-h> :bp<CR>

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
vnoremap + :call nerdcommenter#Comment(0,"toggle")<CR> 

" -- Vimtex [will be updated more later] --
" using skim as the PDF viewer
" Preferences > reload automatically for live preview
" Auto-compile mode: \ll
" Forward-search: \lv
" Backward-search: No idea yet

let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=1
let g:tex_conceal='abdmg'
" Default compiling format
let g:Tex_DefaultTargetFormat='pdf'

" Never Forget, To set the default viewer:: Very Important
let g:Tex_ViewRule_pdf = 'zathura'

function! Synctex()
        " remove 'silent' for debugging
        execute "silent !zathura --synctex-forward " . line('.') . ":" . col('.') . ":" . bufname('%') . " " . g:syncpdf
endfunction
map <C-enter> :call Synctex()<cr>

" closing quickfix window
nnoremap <Leader>c :cclose<CR>

" closing the quickfix window if it is the only window
" https://stackoverflow.com/questions/7476126/how-to-automatically-close-the-quick-fix-window-when-leaving-a-file
aug QFClose
  au!
  au WinEnter * if winnr('$') == 1 && &buftype == "quickfix"|q|endif
aug END
