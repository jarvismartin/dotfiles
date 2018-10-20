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
call minpac#add('prettier/vim-prettier', { 'do': 'yarn install' })
call minpac#add('SirVer/ultisnips')
call minpac#add('ctrlpvim/ctrlp.vim')
call minpac#add('vim-airline/vim-airline')
call minpac#add('vim-airline/vim-airline-themes')
call minpac#add('tpope/vim-surround')
call minpac#add('gko/vim-coloresque')
" call minpac#add('junegunn/fzf.vim')

" Load the plugins right now. (optional)
" packloadall

" Toggle NERDTree
map <C-n> :NERDTreeToggle<CR>

let g:airline_theme='simple'

" Underline current line
set cursorline
" Deal with tabs
set tabstop=4
set softtabstop=0 noexpandtab
set shiftwidth=4
" Add line numbers
set number
" Clear trailing white space on save
autocmd BufWritePre * :%s/\s\+$//e

