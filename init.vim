" Plugins will be downloaded under the specified directory.
call plug#begin('~/.vim/plugged')

" Declare the list of plugins.
Plug 'alaviss/nim.nvim'
Plug 'mhartington/oceanic-next'
Plug 'scrooloose/nerdtree'
Plug 'scrooloose/nerdcommenter'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'dense-analysis/ale'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'neoclide/coc.nvim', {'tag': '*', 'branch': 'release'}
" Intellisense/Autocomplete.
" :CocInstall coc-tsserver coc-json coc-css coc-html

" Plug 'ctrlpvim/ctrlp.vim'
" Plug 'rakr/vim-one'
" Plug 'prettier/vim-prettier', { 'do': 'npm install' }

" Always load vim-devicons LAST!!!
Plug 'ryanoasis/vim-devicons'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" BASIC SETUP
" enter the current millenium
set encoding=UTF-8
set nocompatible        " not Vi
syntax enable           " enable syntax processing
filetype plugin on      " enable plugins

" FINDING FILES:
" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Display all matching files when we tab complete
set wildmenu

let mapleader=","       " leader is comma

" TABS
set expandtab       " tabs are spaces
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " change the number of space characters inserted for indentation

set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldmethod=indent   " fold based on indent level
set noswapfile          " No swap file
" filetype indent on      " load filetype-specific indent files

" jk is escape
inoremap jk <esc>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" fzy
function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <leader>e :call FzyCommand("find . -type f", ":e")<cr>
nnoremap <leader>v :call FzyCommand("find . -type f", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("find . -type f", ":sp")<cr>

"" FZF
"nnoremap <C-p> :Files<CR>
"nnoremap <Leader>b :Buffers<CR>
"nnoremap <Leader>h :History<CR>
"" fzf use ripgrep instead of ag:
"command! -bang -nargs=* Rg
"\ call fzf"vim"grep(
"\   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"\   <bang>0 ? fzf"vim"with_preview('up:60%')
"\           : fzf"vim"with_preview('right:50%:hidden', '?'),
"\   <bang>0)
"
"" Likewise, Files command with preview window
"command! -bang -nargs=? -complete=dir Files
"  \ call fzf"vim"files(<q-args>, fzf"vim"with_preview(), <bang>0)

" ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'jsx': ['eslint'],
\   'jsm': ['eslint'],
\   'typescript': ['eslint'],
\   'tsx': ['eslint']
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" " Strip Trailing White Space on Save
" function! TrimWhiteSpace()
    " %s/\s\+$//e
" endfunction
" autocmd BufWritePre     *.* :call TrimWhiteSpace()

" Prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.jsm,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Handle .jsm files
autocmd BufRead,BufNewFile *.jsm set filetype=javascript

" Nerdtree
nmap <C-n> :NERDTreeToggle<CR>
" Nerd Commenter
filetype plugin on
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

colorscheme OceanicNext
" colorscheme one
" set background=dark " for the dark version
" set background=light " for the light version

"" open rg.vim
nnoremap <leader>r :Rg

"" CtrlP settings
"let g:ctrlp_match_window = 'bottom,order:ttb'
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'rg %s -l --nocolor --hidden -g ""'
"let g:ctrlp_user_command = 'rg %s -l --nocolor -g ""'

" set number              " show line numbers

let mapleader=","       " leader is comma

" TABS
set expandtab       " tabs are spaces
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " change the number of space characters inserted for indentation

set showcmd             " show command in bottom bar
set cursorline          " highlight current line
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldmethod=indent   " fold based on indent level
set noswapfile          " No swap file
" filetype indent on      " load filetype-specific indent files

" jk is escape
inoremap jk <esc>

" toggle gundo
nnoremap <leader>u :GundoToggle<CR>

" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>

" fzy
function! FzyCommand(choice_command, vim_command)
  try
    let output = system(a:choice_command . " | fzy ")
  catch /Vim:Interrupt/
    " Swallow errors from ^C, allow redraw! below
  endtry
  redraw!
  if v:shell_error == 0 && !empty(output)
    exec a:vim_command . ' ' . output
  endif
endfunction

nnoremap <leader>e :call FzyCommand("find . -type f", ":e")<cr>
nnoremap <leader>v :call FzyCommand("find . -type f", ":vs")<cr>
nnoremap <leader>s :call FzyCommand("find . -type f", ":sp")<cr>

"" FZF
"nnoremap <C-p> :Files<CR>
"nnoremap <Leader>b :Buffers<CR>
"nnoremap <Leader>h :History<CR>
"" fzf use ripgrep instead of ag:
"command! -bang -nargs=* Rg
"\ call fzf"vim"grep(
"\   'rg --column --line-number --no-heading --color=always --smart-case '.shellescape(<q-args>), 1,
"\   <bang>0 ? fzf"vim"with_preview('up:60%')
"\           : fzf"vim"with_preview('right:50%:hidden', '?'),
"\   <bang>0)
"
"" Likewise, Files command with preview window
"command! -bang -nargs=? -complete=dir Files
"  \ call fzf"vim"files(<q-args>, fzf"vim"with_preview(), <bang>0)

" ALE
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'javascript': ['eslint'],
\   'jsx': ['eslint'],
\   'jsm': ['eslint'],
\   'typescript': ['eslint'],
\   'tsx': ['eslint']
\}
" Set this variable to 1 to fix files when you save them.
let g:ale_fix_on_save = 1

" " Strip Trailing White Space on Save
" function! TrimWhiteSpace()
    " %s/\s\+$//e
" endfunction
" autocmd BufWritePre     *.* :call TrimWhiteSpace()

" Prettier on save
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.jsm,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Handle .jsm files
autocmd BufRead,BufNewFile *.jsm set filetype=javascript

" Nerdtree
nmap <C-n> :NERDTreeToggle<CR>
" Nerd Commenter
filetype plugin on
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

colorscheme OceanicNext
" colorscheme one
" set background=dark " for the dark version
" set background=light " for the light version

"" open rg.vim
nnoremap <leader>r :Rg

"" CtrlP settings
"let g:ctrlp_match_window = 'bottom,order:ttb'
"let g:ctrlp_switch_buffer = 0
"let g:ctrlp_working_path_mode = 0
"let g:ctrlp_user_command = 'rg %s -l --nocolor --hidden -g ""'
"let g:ctrlp_user_command = 'rg %s -l --nocolor -g ""'

" set number              " show line numbers

