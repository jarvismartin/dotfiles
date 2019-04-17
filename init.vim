packadd minpac

call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})

" Add other plugins here.
call minpac#add('pangloss/vim-javascript')
call minpac#add('joukevandermaas/vim-ember-hbs')
call minpac#add('leafgarland/typescript-vim')
call minpac#add('sheerun/vim-polyglot')
call minpac#add('w0rp/ale')
call minpac#add('scrooloose/nerdtree')
call minpac#add('prettier/vim-prettier', { 'do': 'npm install' })
call minpac#add('SirVer/ultisnips')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('gko/vim-coloresque')
call minpac#add('junegunn/fzf.vim')
call minpac#add('Townk/vim-autoclose')
call minpac#add('tpope/vim-surround')
call minpac#add('Xuyuanp/nerdtree-git-plugin')
call minpac#add('jparise/vim-graphql')
" call minpac#add('fatih/vim-go', { 'do': ':GoUpdateBinaries' })
" call minpac#add('Valloric/YouCompleteMe', { 'do': './install.py --ts-completer' })

" call minpac#add('ctrlpvim/ctrlp.vim')
" Load the plugins right now. (optional)
" packloadall

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" ALE
let g:ale_completion_enabled = 1
let g:ale_set_highlights = 0

" FZF
set rtp+=~/.fzf
" map <C-p> :Files<Cr>

" Airline
let g:airline_powerline_fonts = 1
let g:airline_theme='powerlineish'

" Underline current line
set cursorline
" Deal with tabs
set tabstop=4
" set softtabstop=0 noexpandtab
" set shiftwidth=2
" Add line numbers
" set number
" Clear trailing white space on save
autocmd BufWritePre * :%s/\s\+$//e

" syntax on
" Fix syntax highlighting
" set background=dark

" Prettier
let g:prettier#autoformat = 0
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Silver Searcher
let g:ackprg = 'ag --vimgrep'

" YCM
" Start autocompletion after 4 chars
" let g:ycm_min_num_of_chars_for_completion = 4
" let g:ycm_min_num_identifier_candidate_chars = 4
" let g:ycm_enable_diagnostic_highlighting = 0
" Don't show YCM's preview window [ I find it really annoying ]
" set completeopt-=preview
" let g:ycm_add_preview_to_completeopt = 0
