syntax on
filetype plugin on

"set iskeyword-=_
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
" set nohlsearch
" set clipboard=unnamed 
set rtp+='/home/th.nguyen/torchvr/lib/python3.5/site-packages/powerline/bindings/vim'
command! Maketags !ctags -R .


call plug#begin('~/.vim/plugged')
Plug 'morhetz/gruvbox'
Plug 'preservim/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline-themes'
Plug '907th/vim-auto-save'
Plug 'djoshea/vim-autoread'
Plug 'ErichDonGubler/vim-sublime-monokai'
Plug 'vim-python/python-syntax'
Plug 'michaeljsmith/vim-indent-object'
Plug 'jeetsukumaran/vim-pythonsense'
Plug 'yuttie/comfortable-motion.vim'
Plug 'jpalardy/vim-slime', { 'for': 'python' }
Plug 'hanschen/vim-ipython-cell', { 'for': 'python' }
Plug 'xolox/vim-misc'
Plug 'xolox/vim-notes'
Plug 'unblevable/quick-scope'
Plug 'dhruvasagar/vim-table-mode'
Plug 'neovim/nvim-lspconfig'
Plug 'kabouzeid/nvim-lspinstall'
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/delimitMate.vim'
Plug 'ThePrimeagen/vim-be-good'

Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/nvim-cmp'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
call plug#end()


" colorscheme sublimemonokai
let g:gruvbox_contrast_dark = 'hard'
set t_Co=256
colorscheme gruvbox
set background=dark

" nvim-autocomplete
" Use <Tab> and <S-Tab> to navigate through popup menu
inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"


lua vim.lsp.handlers["textDocument/publishDiagnostics"] = function() end
set completeopt=menuone,noinsert,noselect
" let g:completion_matching_strategy_list = ['exact', 'subtring', 'fuzzy']"

lua << EOF
 -- Setup nvim-cmp.
  local cmp = require'cmp'
  
  cmp.setup({
    snippet = {
      expand = function(args)
        -- For `vsnip` user.
        vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` user.
      end,
    },
    mapping = {
      ['<C-d>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.close(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
      { name = 'nvim_lsp' },
  
      -- For vsnip user.
      { name = 'vsnip' },
  
      -- For luasnip user.
      -- { name = 'luasnip' },
  
      -- For ultisnips user.
      -- { name = 'ultisnips' },
  
      { name = 'buffer' },
    }
  })
  
  -- Setup lspconfig.
  require('lspconfig').pyright.setup {
    capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
    }
EOF

" Mapping
let mapleader = " "
map tt :tabnew
nnoremap H gT
nnoremap L gt
nnoremap <Leader>g <C-]>

" Python execution

map <C-n> :NERDTreeToggle<CR>

" air-line
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='powerlineish'
let g:tmuxline_theme = 'powerline'
let g:airline#extensions#tmuxline#enabled = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    endif

" Autosave
let g:auto_save = 1

" fugitive
nmap gs :G<CR>

" Syntax highlting 
let g:python_highlight_all = 1

" Ipython 
let g:slime_target = 'tmux'
nnoremap <Leader>s :SlimeSend1 ipython --matplotlib<CR>
nnoremap <Leader>c :IPythonCellExecuteCell<CR>
nnoremap <Leader>l :IPythonCellClear<CR>
"Create new cell
nnoremap <Leader>n i{{{python #%%#%%}}}<ESC>hhhhhi<CR><ESC>O
nnoremap <Leader>q :SlimeSend1 exit<CR>
let g:slime_python_ipython = 1

" always send text to the top-right pane in the current tmux tab without asking
let g:slime_default_config = {
            \ 'socket_name': get(split($TMUX, ','), 0),
            \ 'target_pane': '{top-right}' }
let g:slime_dont_ask_default = 1

"Notes
let g:notes_suffix = '.py'
let g:notes_directories = ['~/Notes/']

" Quick scope
highlight QuickScopePrimary guifg='#afff5f' gui=underline ctermfg=155 cterm=underline
" Vim commentary
autocmd FileType notes setlocal commentstring=#\ %s

"pdb debug
nnoremap <Leader>d oimport pdb; pdb.set_trace()<ESC>

" telescope
" noremap <C-p> :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({}))<cr>
noremap <C-p> :lua require'telescope.builtin'.find_files()<cr>
