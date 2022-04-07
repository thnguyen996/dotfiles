syntax on
filetype plugin indent on

set nocompatible
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
set spell
set spelllang=en_gb
set nofoldenable

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

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'lervag/vimtex'
Plug 'sirver/ultisnips'
Plug 'rhysd/vim-grammarous'
Plug 'rickhowe/diffchar.vim'
call plug#end()

set t_Co=256
let g:gruvbox_contrast_dark = 'hard'
set background=dark
colorscheme gruvbox

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

" vimdiff
au VimEnter *.tex if &diff | execute 'windo set wrap nofoldenable' | let g:qs_enable=0 | endif
nnoremap <Leader>i :call diffchar#CopyDiffCharPair(0)<CR>


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

" fzf
" Path completion
imap <c-x><c-f> <plug>(fzf-complete-path)  


" vimwiki

let g:vimwiki_list = [{'path': '~/vimwiki/', 'syntax': 'markdown', 'ext': '.md'}]

" vimtex
let g:tex_flavor = 'latex'
" let g:vimtex_view_method = 'zathura'
let g:vimtex_view_general_viewer = 'okular'
let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
let g:latex_viewer = 'zathura'
autocmd BufNewFile,BufRead *.tex set wrap linebreak nolist nofoldenable
let g:UltiSnipsExpandTrigger = '<C-j>'
let g:UltiSnipsJumpForwardTrigger = '<C-j>'
let g:UltiSnipsJumpBackwardTrigger = '<C-k>'
let g:vimtex_quickfix_mode = 0
let g:UltiSnipsSnippetDirectories=[$HOME.'/.config/snippets']
set thesaurus+=$HOME/.config/thesaurus/thesaurii.txt
let g:qs_max_chars=10000

" completor vim
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<cr>"
let g:completor_complete_options = 'menuone,noselect,preview'
let g:completor_tex_omni_trigger =
        \   '\\(?:'
        \  .   '\w*cite\w*(?:\s*\[[^]]*\]){0,2}\s*{[^}]*'
        \  .  '|\w*ref(?:\s*\{[^}]*|range\s*\{[^,}]*(?:}{)?)'
        \  .  '|hyperref\s*\[[^]]*'
        \  .  '|includegraphics\*?(?:\s*\[[^]]*\]){0,2}\s*\{[^}]*'
        \  .  '|(?:include(?:only)?|input)\s*\{[^}]*'
        \  .')'

