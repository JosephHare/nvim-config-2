nnoremap <A-l> <cmd>tabnext<cr>
inoremap <A-l> <C-o><cmd>tabnext<cr>
nnoremap <A-h> <cmd>tabprev<cr>
inoremap <A-h> <C-o><cmd>tabprev<cr>
nnoremap <A-S-h> <cmd>tabmove -1<cr>
nnoremap <A-S-l> <cmd>tabmove +1<cr>
nnoremap <A-t> <cmd>tabnew<cr>
nnoremap <A-d> <C-w>s<C-w>k<C-w>T
inoremap <A-d> <C-o><C-w>s<C-o><C-w>k<C-o><C-w>T

nnoremap <A-a> <C-w>3<lt>
nnoremap <A-u> <C-w>3>
inoremap <A-a> <C-o><C-w>3<lt>
inoremap <A-u> <C-o><C-w>3>

inoremap <A-s-e> std::endl;

nnoremap <leader>w <cmd>w<cr>
nnoremap <leader>y "+y
vnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <A-S-v> <C-v>
inoremap <A-.> <Space><C-o>h
nnoremap <leader>uh <cmd>set hlsearch!<cr>
nnoremap cm cw
nnoremap cM cW

nnoremap <A-S-g> mBO<esc>0D`B
nnoremap <A-g> mBo<esc>0D`B
inoremap <A-g> <cmd>set virtualedit=all<cr><C-o>mB<esc>o<esc>0D`Bi<cmd>set virtualedit=none<cr>
inoremap <A-S-g> <cmd>set virtualedit=all<cr><C-o>mB<esc>O<esc>0D`Bi<cmd>set virtualedit=none<cr>

nnoremap <leader>uc <cmd>s/\\/\\\\/g<cr>
nnoremap <leader>ug mBi{<enter><C-o>$}<C-o>i<enter><esc>`B
nnoremap <leader>um <cmd>tcd %:p:h<cr>

nnoremap <leader>s dhp
nnoremap n nzz
nnoremap N Nzz

lua << EOF

vim.keymap.set('n', '<leader>lr', function() vim.lsp.buf.rename() end)
vim.keymap.set('n', '<leader>lx', function() vim.lsp.buf.references() end)
vim.keymap.set('n', '<leader>ld', function() vim.lsp.buf.definition() end)
vim.keymap.set('n', '<leader>lh', function() vim.lsp.buf.hover() end)
vim.keymap.set('n', '<leader>le', function() vim.diagnostic.open_float() end)

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

EOF
