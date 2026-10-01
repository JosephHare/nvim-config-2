set shiftwidth=4 smarttab
set tabstop=4
set expandtab
set relativenumber
set number
set nohlsearch
set ignorecase
set linebreak " break on word boundaries

let mapleader = ","

function! s:Vviedit()
    tabnew
    if has("unix")
        tcd /home/joe/.config/nvim/
        e init.vim
    else
        tcd C:\Users\josep\AppData\Local\nvim
        e C:\Users\josep\AppData\Local\nvim\init.vim
    endif
endfunction
command Vviedit call s:Vviedit()

function! s:Tmpedit()
    tabnew
    tcd $Tmp
    e tmp.vim
endfunction
command Tmpedit call s:Tmpedit()

call plug#begin()
    Plug 'neovim/nvim-lspconfig'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'nvim-treesitter/nvim-treesitter-context'
    " Plug 'ludovicchabant/vim-gutentags'
    Plug 'windwp/nvim-autopairs'
    Plug 'windwp/nvim-ts-autotag'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope-fzf-native.nvim', {'do': 'make'}
    Plug 'nvim-telescope/telescope.nvim'
    Plug 'nvim-telescope/telescope-file-browser.nvim'
    Plug 'nvim-mini/mini.icons'
    Plug 'MeanderingProgrammer/render-markdown.nvim'
    Plug 'ice345/markdown-table-wrap.nvim'

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

if has("unix")
    luafile /home/joe/.config/nvim/nvim-cmp-setup.lua
    luafile /home/joe/.config/nvim/init-lua.lua
    source /home/joe/.config/nvim/keybinds.vim
else
    source C:\Users\josep\AppData\Local\nvim\snippets.lua
    luafile C:\Users\josep\AppData\Local\nvim\nvim-cmp-setup.lua
    luafile C:\Users\josep\AppData\Local\nvim\init-lua.lua
    source C:\Users\josep\AppData\Local\nvim\keybinds.vim
endif

function! SimpleTabLabel(n)
  let buflist = tabpagebuflist(a:n)
  let winnr = tabpagewinnr(a:n)
  return expand('#' . buflist[winnr - 1] . ':t')
endfunction

function! SimpleTabLine()
    let s = ''
    for i in range(tabpagenr('$'))
        if i + 1 == tabpagenr()
            let s .= '%#TabLineSel#'
        else
            let s .= '%#TabLine#'
        endif
        let s .= '%' . (i + 1) . 'T'
        let s .= ' %{SimpleTabLabel(' . (i + 1) . ')} '
    endfor
    let s .= '%#TabLineFill#%T'
    return s
endfunction

function! ReTab()
    %s/^\(\s*\)/\=repeat(' ', len(submatch(1))*2)
endfunction

set tabline=%!SimpleTabLine()
set showtabline=2

set background=light
colorscheme vscode

"autocmd BufWinEnter * silent tcd %:p:h
