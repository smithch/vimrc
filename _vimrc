"Last edit 01/18/2019
"
set nocompatible

" Set make program 
"set makeprg=:terminal\ build.bakkt
"
" Set leader key 
"let mapleader ","

" Chnage to working directory
:cd c:\work 

set modifiable

" Split and open vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source myvimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

colorscheme zenburn
"colorscheme evening
"colorscheme wal

" Remove ugly gui buttons
set guioptions=Ace

set guifont=Inconsolata\ for\ Powerline:h15

" Don't try to be vi compatible
set nocompatible 

" Helps force plugins to load correctly when it is turned back on below
"filetype off

" Load filetype-specific indent files
filetype indent on 
filetype plugin indent on

" Turn on syntax highlighting
syntax on

" Show line numbers hybrid mode
set number relativenumber 

" Toggle between number modes when focus changes
augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter * set norelativenumber
augroup END

" Blink cursor on error instead of beeping (grr)
set visualbell

" turn off bell 
set belloff=all

" Highlight current line
set cursorline

" Encoding
set encoding=UTF-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set noshiftround


" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" visual autocomplete for command menu
set wildmenu

" Search down into subfolders
" Provides tab-completion for all files -related tasks
set path+=**
" Hit tab to :find by partial match
" Use * to make it fuzzy 
" :b lets you autocomplete any open buffer
"
set foldmethod=syntax




" Key remaps
inoremap jk <esc>
inoremap kj <esc>

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" highlight last inserted text
nnoremap gV `[v`]

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

nnoremap <C-Left> :tabprevious<CR>
nnoremap <C-Right> :tabnext<CR>

" Detect what OS is running
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif
if g:os == "Windows"
    set backupdir=.\_backup,c:\temp
    set directory=.\_backup,c:\temp

    if filewritable(expand('%:p:h')."\.") && !filewritable(expand('%:p:h').'\_backup')
    	silent execute '!mkdir "'.expand('%:p:h').'\_backup"'
    endif
endif

" netrw nerd_tree replacement
" let g:netrw_banner = 0
" let g:netrw_liststyle = 3
" let g:netrw_browse_split = 4
" let g:netrw_altv = 1
" let g:netrw_winsize = 25
" augroup ProjectDrawer
"   autocmd!
"   autocmd VimEnter * :Vexplore
" augroup END    

" air-line plugin specific commands
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

"Enable airline for tabs
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = ''
let g:airline#extensions#tabline#right_sep = ''
let g:airline#extensions#tabline#right_alt_sep = ''
let g:airline#extensions#tabline#formatter = 'unique_tail'

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" Use deoplete.
let g:deoplete#enable_at_startup = 1

"Vim-plug 
call plug#begin('$HOME/vimfiles')
    Plug 'vhda/verilog_systemverilog.vim'
    Plug 'vim-airline/vim-airline'
    "Plug 'scrooloose/nerdtree'
    Plug 'scrooloose/syntastic'
    Plug 'vimwiki/vimwiki'
    Plug 'aserebryakov/vim-todo-lists'
    "Plug 'ryanoasis/vim-devicons'
    Plug 'ervandew/supertab'
    Plug 'junegunn/vim-easy-align'
    Plug 'powerline/fonts'
    Plug 'tpope/vim-commentary'
    Plug 'junegunn/fzf'
    Plug 'airblade/vim-gitgutter' 
    Plug 'tpope/vim-fugitive'    "Git 
    "Plug 'dylanaraps/wal.vim'
    Plug 'sjl/badwolf' "Color scheme
    Plug 'jnurmine/zenburn' "Color scheme
    Plug 'tpope/vim-surround'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'tpope/vim-vinegar'
    Plug 'universal-ctags/ctags'
    Plug 'powerline/powerline-fonts'
    Plug 'tpope/vim-sensible'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'junegunn/vim-peekaboo'
    Plug 'mbbill/undotree'
    Plug 'danro/rename.vim'
    Plug 'mhinz/vim-startify'
    Plug 'dense-analysis/ale'
    "Plug 'Shougo/deoplete.nvim'
    "Plug 'autozimu/LanguageClient-neovim', {
    "    \ 'branch': 'next',
    "    \ 'do': 'bash install.sh',
    "    \ }
    Plug 'junegunn/goyo.vim' "Distraction free writing use :Goyo :Goyo!
    Plug 'junegunn/lmelight.vim' "Dims surrounding paragraphs use :Limelight!
    

call plug#end()


" Last line
set showmode
set showcmd
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim

set diffexpr=MyDiff()
function! MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg1 = substitute(arg1, '!', '\!', 'g')
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg2 = substitute(arg2, '!', '\!', 'g')
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let arg3 = substitute(arg3, '!', '\!', 'g')
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      if empty(&shellxquote)
        let l:shxq_sav = ''
        set shellxquote&
      endif
      let cmd = '"' . $VIMRUNTIME . '\diff"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  let cmd = substitute(cmd, '!', '\!', 'g')
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3
  if exists('l:shxq_sav')
    let &shellxquote=l:shxq_sav
  endif
endfunction


" Notes section 
"
" Hex Editing
" :%!xxd enter hex mode 
" :%!xxd -r exit hex mode
"
"
"
