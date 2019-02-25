"Last edit 01/18/2019
"

" Set make program 
"set makeprg=:terminal\ build.bakkt
"
" Set leader key 
let mapleader ","

" Chnage to working directory
:cd d:\work 

" Split and open vimrc
nnoremap <leader>ev :vsplit $MYVIMRC<cr>

" Source myvimrc
nnoremap <leader>sv :source $MYVIMRC<cr>

colorscheme evening

" Remove ugly gui buttons
set guioptions=Ace

set guifont=Source_Code_Pro:h14

" Don't try to be vi compatible
set nocompatible 

" Helps force plugins to load correctly when it is turned back on below
"filetype off

" Load filetype-specific indent files
filetype indent on 

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
set encoding=utf-8

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

" Key remaps
inoremap jk <esc>
inoremap kj <esc>

" Set leader key
let mapleader=","

" move to beginning/end of line
nnoremap B ^
nnoremap E $

" highlight last inserted text
nnoremap gV `[v`]

" <Ctrl-l> redraws the screen and removes any search highlighting.
nnoremap <silent> <C-l> :nohl<CR><C-l>

" Detect what OS is running
if !exists("g:os")
    if has("win64") || has("win32") || has("win16")
        let g:os = "Windows"
    else
        let g:os = substitute(system('uname'), '\n', '', '')
    endif
endif
if g:os == "Windows"
    set backupdir=.\_backup,.,c:\temp
    set directory=.\_backup,.,c:\temp

    if filewritable(expand('%:p:h')."\.") && !filewritable(expand('%:p:h').'\_backup')
    	silent execute '!mkdir "'.expand('%:p:h').'\_backup"'
    endif
endif

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