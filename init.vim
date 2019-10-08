
" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugs')

" Plugins
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'sbdchd/neoformat'

" Plug 'othree/yajs.vim'
" Plug 'othree/html5.vim'
" Plug 'HerringtonDarkholme/yats.vim'
" Plug 'nestorsalceda/vim-strip-trailing-whitespaces'
" Plug 'tpope/vim-surround'
" Plug 'easymotion/vim-easymotion'

" Always load vim-devicons LAST!!!
Plug 'ryanoasis/vim-devicons'

" theme
Plug 'mhartington/oceanic-next'

" Initialize plugin system
call plug#end()

" For Neovim >= 0.1.5
if (has("termguicolors"))
 set termguicolors
endif

" Theme
syntax on
let g:oceanic_next_terminal_bold = 1
let g:oceanic_next_terminal_italic = 1
colorscheme OceanicNext
let g:airline_theme='oceanicnext'

" Nerdtree
nmap <C-n> :NERDTreeToggle<CR>

" EasyMotion
" map <Leader> <Plug>(easymotion-prefix)

" Underline current line
set cursorline

set noswapfile " No swap file
set nobackup
set nowritebackup
set autoindent
set copyindent
set preserveindent

" 4-space tabs
set tabstop=4
set shiftwidth=0
