nnoremap <A-l> <cmd>tabnext<cr>
inoremap <A-l> <C-o><cmd>tabnext<cr>
nnoremap <A-h> <cmd>tabprev<cr>
inoremap <A-h> <C-o><cmd>tabprev<cr>
nnoremap <A-S-h> <cmd>tabmove -1<cr>
nnoremap <A-S-l> <cmd>tabmove +1<cr>
nnoremap <A-t> <cmd>tabnew<cr><cmd>Telescope find_files<cr>
nnoremap <A-n> <cmd>tabnew<cr>
nnoremap <A-d> <C-w>s<C-w>k<C-w>T
inoremap <A-d> <C-o><C-w>s<C-o><C-w>k<C-o><C-w>T

nnoremap <A-i> <C-w>3>
nnoremap <A-u> <C-w>-
nnoremap <A-e> <C-w>+
nnoremap <A-o> <C-w>3<lt>
vnoremap <A-i> <C-w>3>
vnoremap <A-u> <C-w>-
vnoremap <A-e> <C-w>+
vnoremap <A-o> <C-w>3<lt>
inoremap <A-i> <C-o><C-w>3>
inoremap <A-u> <C-o><C-w>-
inoremap <A-e> <C-o><C-w>+
inoremap <A-o> <C-o><C-w>3<lt>

inoremap <A-s-e> << std::endl

nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>z <cmd>q<cr>
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <A-S-v> <C-v>
vnoremap <A-S-v> <C-v>
inoremap <A-.> <Space><C-o>h
nnoremap <leader>uh <cmd>set hlsearch!<cr>
nnoremap cm cw
nnoremap cM cW

nnoremap <leader>. "h
vnoremap <leader>. "h

nnoremap <A-S-g> mBO<esc>0D`B
nnoremap <A-g> mBo<esc>0D`B
inoremap <A-g> <cmd>set virtualedit=all<cr><C-o>mB<esc>o<esc>0D`Bi<cmd>set virtualedit=none<cr>
inoremap <A-S-g> <cmd>set virtualedit=all<cr><C-o>mB<esc>O<esc>0D`Bi<cmd>set virtualedit=none<cr>
inoremap <A-c> <C-o>A

nnoremap <leader>uc <cmd>s/\\/\\\\/g<cr>
nnoremap <leader>un \/^[<=>]\{7\}
" nnoremap <leader>uN ?^[<=>|]\{7\}
vnoremap <leader>uc <cmd>'<,'>s/\%V\\/\\\\/g<cr>
nnoremap <leader>ug mBi{<enter><C-o>$}<C-o>i<enter><esc>`B
nnoremap <leader>ud mBxxJjdd`B
nnoremap <leader>um <cmd>tcd %:p:h<cr>
nnoremap <leader>ua <cmd>s/"/`/g<cr>
nnoremap <leader>us <cmd>e .<cr>
nnoremap <leader>uw <cmd>set wrap!<cr>
nnoremap <leader>uu <cmd>source %<cr>

nnoremap <leader>s dhp
nnoremap n nzz
nnoremap N Nzz

noremap <C-M-t> k<C-y>
noremap <C-M-h> j<C-e>
noremap <C-M-d> zh
noremap <C-M-n> zl
noremap <C-M-g> zH
noremap <C-M-r> zL

autocmd Filetype css nnoremap <buffer> <leader>/ mBI/*<space><C-o>A<space>*/<esc>`Blll
autocmd Filetype javascript nnoremap <buffer> <leader>/ mBI//<esc>`Bll
autocmd Filetype cpp nnoremap <buffer> <leader>/ mBI//<esc>`Bll
autocmd Filetype html nnoremap <buffer> <leader>/ mBI<!--<esc>$a--><esc>`B

autocmd Filetype javascript nnoremap <buffer> <leader>= mB^xx`B
autocmd Filetype cpp nnoremap <buffer> <leader>= mB^xx`B
autocmd Filetype css nnoremap <buffer> <leader>= mB^xxx$xxx`B
autocmd Filetype html nnoremap <buffer> <leader>= mB^xxxx$xxx`B

lua << EOF

vim.keymap.set('n', '<leader>lr', function() vim.lsp.buf.rename() end)
vim.keymap.set('n', '<leader>lx', function() vim.lsp.buf.references() end)
vim.keymap.set('n', '<leader>ld', function() vim.lsp.buf.definition() end)
vim.keymap.set('n', '<leader>lh', function() vim.lsp.buf.hover() end)
vim.keymap.set('n', '<leader>le', function() vim.diagnostic.open_float() end)
vim.keymap.set('n', '<leader>li', function() vim.lsp.buf.implementation() end)

local ls = require("luasnip")
vim.keymap.set({"i"}, "<C-t>", function() ls.expand() end, { silent = true })
vim.keymap.set({"i", "s"}, "<C-n>", function()
    if ls.choice_active() then
        ls.jump(1)
    end
end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-p>", function()
    if ls.choice_active() then
        ls.jump(-1)
    end
end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-l>", function()
    if ls.in_snippet() then
        ls.jump(1)
    end
end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-h>", function()
    if ls.in_snippet() then
        ls.jump(-1)
    end
end, {silent = true})


local telescope_builtin = require('telescope.builtin')
local telescope = require('telescope')
vim.keymap.set('n', '<leader>tf', telescope_builtin.find_files, { desc = 'Telescope find files' })
vim.keymap.set('n', '<leader>ta', telescope.extensions.file_browser.file_browser, { desc = 'Telescope browse files' })
vim.keymap.set('n', '<leader>tg', telescope_builtin.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>tb', telescope_builtin.buffers, { desc = 'Telescope buffers' })
vim.keymap.set('n', '<leader>th', telescope_builtin.help_tags, { desc = 'Telescope help tags' })

EOF
