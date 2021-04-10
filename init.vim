"From https://medium.com/better-programming/setting-up-neovim-for-web-development-in-2020-d800de3efacd
call plug#begin("~/.vim/plugged")
" Plugin Section
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'leafOfTree/vim-svelte-plugin'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'xojs/vim-xo'
Plug 'vim-syntastic/syntastic'
Plug 'Chiel92/vim-autoformat'

" vim-markdown-composer
function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }

call plug#end()

"Config Section

" CoC
let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-tsserver', 'coc-svelte']

" Important!!
" if has('termguicolors')
" set termguicolors
" endif

" For dark version.
set background=dark

" For light version.
" set background=light

" Set contrast.
" This configuration option should be placed before `colorscheme gruvbox-material`.
" Available values: 'hard', 'medium'(default), 'soft'
" let g:gruvbox_material_background = 'soft'

colorscheme gruvbox

" " Delete whitespace on save
" autocmd BufWritePre * :%s/\s\+$//e
" " tabs -> spaces
" set tabstop=2 shiftwidth=2 expandtab

" treat all *.svelte files as HTML
" au! BufNewFile,BufRead *.svelte set ft=html

let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <C-b> :NERDTreeToggle<CR>
" Nerd Commenter
filetype plugin on
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Leader
let mapleader = ","

" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://bash
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>

" use alt+hjkl to move between split/vsplit panels
tnoremap <A-h> <C-\><C-n><C-w>h
tnoremap <A-j> <C-\><C-n><C-w>j
tnoremap <A-k> <C-\><C-n><C-w>k
tnoremap <A-l> <C-\><C-n><C-w>l
nnoremap <A-h> <C-w>h
nnoremap <A-j> <C-w>j
nnoremap <A-k> <C-w>k
nnoremap <A-l> <C-w>l

nnoremap <C-p> :FZF<CR>
let g:fzf_action = {
      \ 'ctrl-t': 'tab split',
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit'
      \}

let $FZF_DEFAULT_COMMAND = 'ag -g ""'

" " Handle .jsm files
" autocmd BufRead,BufNewFile *.jsm set filetype=javascript

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

set showmatch           " Show matching brackets.
" set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
" set expandtab           " Insert spaces when TAB is pressed.
" set tabstop=4           " Render TABs using this many spaces.
" set shiftwidth=4        " Indentation amount for < and > commands.

set cursorline

" Remap Esc
:imap jk <Esc>

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

" Lint with XO via Syntastic
let g:syntastic_javascript_checkers = ['xo']

" vim-autoformat requires path to python executable
let g:python3_host_prog='/usr/bin/python3'

" Use Python3 interpreter in python-mode
let g:pymode_python = 'python3'
