set shiftwidth=4 smarttab
set tabstop=4
set expandtab
set relativenumber
set number
set nohlsearch
set ignorecase

let mapleader = ","

function! s:Vviedit()
    tabnew
    tcd C:\Users\josep\AppData\Local\nvim
    e C:\Users\josep\AppData\Local\nvim\init.vim
endfunction
command Vviedit call s:Vviedit()

call plug#begin()
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    " Plug 'ludovicchabant/vim-gutentags'
    Plug 'windwp/nvim-autopairs'
    Plug 'windwp/nvim-ts-autotag'

    " nvim cmp plugins
    Plug 'hrsh7th/cmp-nvim-lsp'
    Plug 'hrsh7th/cmp-buffer'
    Plug 'hrsh7th/cmp-path'
    Plug 'hrsh7th/cmp-cmdline'
    Plug 'hrsh7th/nvim-cmp'
    Plug 'hrsh7th/cmp-vsnip'
    Plug 'hrsh7th/vim-vsnip'
    Plug 'Mofiqul/vscode.nvim'
    Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}
    Plug 'saadparwaiz1/cmp_luasnip'
    Plug 'rafamadriz/friendly-snippets'
call plug#end()

luafile C:\Users\josep\AppData\Local\nvim\nvim-cmp-setup.lua
luafile C:\Users\josep\AppData\Local\nvim\init-lua.lua
source C:\Users\josep\AppData\Local\nvim\keybinds.vim

autocmd Filetype css nnoremap <leader>/ mBI/*<space><C-o>A<space>*/<esc>`Blll
autocmd Filetype css nnoremap <leader>= mB^xxx$xxx`Bhhh

set background=light
colorscheme vscode
