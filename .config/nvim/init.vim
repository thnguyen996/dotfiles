syntax on
filetype plugin indent on

set noerrorbells
set autoread
set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab 
set smartindent 
set number relativenumber
set nu rnu
set nowrap
set smartcase 
set noswapfile 
set nobackup
set undodir=~/.vim/undodir
set undofile
set incsearch
set path+=**
set nohlsearch
set clipboard=unnamedplus
set rtp+='/home/th.nguyen/torchvr/lib/python3.5/site-packages/powerline/bindings/vim'

" Autosave
let g:auto_save = 1
command! Maketags !ctags -R .

" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
    sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/autoload/plug.vim')
Plug 'morhetz/gruvbox'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline-themes'
Plug '907th/vim-auto-save'
Plug 'djoshea/vim-autoread'
Plug 'vim-python/python-syntax'
Plug 'michaeljsmith/vim-indent-object'
Plug 'yuttie/comfortable-motion.vim'
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'unblevable/quick-scope'
Plug 'dhruvasagar/vim-table-mode'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/delimitMate.vim'
Plug 'nvim-lua/plenary.nvim'

Plug 'maralla/completor.vim'
Plug 'dag/vim-fish'
call plug#end()

let g:gruvbox_contrast_dark = 'hard'
set t_Co=256
colorscheme gruvbox
set background=dark

" nvim-autocomplete
compiler fish

" Mapping
let mapleader = " "
map tt :tabnew
nnoremap H gT
nnoremap L gt
nnoremap x "_x
nnoremap X "_X
nnoremap <Leader>g :call completor#do('definition')<CR>
nnoremap <Leader>s :call completor#do('doc')<CR>

" air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
let g:tmuxline_theme = 'powerline'
let g:airline#extensions#tmuxline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    endif

" Syntax highlting 
let g:python_highlight_all = 1

" Vim commentary
autocmd FileType notes setlocal commentstring=#\ %s

"pdb debug
nnoremap <Leader>d oimport pdb; pdb.set_trace()<ESC>

