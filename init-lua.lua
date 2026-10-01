require("nvim-autopairs").setup {}

-- Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
vim.lsp.config('ts_ls', { capabilities = capabilities })
vim.lsp.enable('ts_ls')
vim.lsp.config('clangd', { capabilities = capabilities })
vim.lsp.enable('clangd')
vim.lsp.config('jedi_language_server', { capabilities = capabilities })
vim.lsp.enable('jedi_language_server')

-- Set up autotag
require('nvim-ts-autotag').setup({
  opts = {
    -- Defaults
    enable_close = true, -- Auto close tags
    enable_rename = true, -- Auto rename pairs of tags
    enable_close_on_slash = false -- Auto close on trailing </
  },
  -- Also override individual filetype configs, these take priority.
  -- Empty by default, useful if one of the "opts" global settings
  -- doesn't work well in a specific filetype
})

-- Treesitter
require('nvim-treesitter').setup {
  install_dir = vim.fn.stdpath('data') .. '/site',
}

require("treesitter-context").setup({
    enable = true,            -- Enable this plugin (Can be toggled with `:TSContextToggle`)
    max_lines = 0,            -- How many lines the window should span. Values <= 0 mean no limit.
    min_window_height = 0,    -- Minimum editor window height to enable context. Values <= 0 mean no limit.
    line_numbers = true,
    multiline_threshold = 20, -- Maximum number of lines to show for a single context
    trim_scope = 'outer',     -- Which context lines to discard if `max_lines` is exceeded
    mode = 'cursor',          -- Line used to calculate context. Choices: 'cursor', 'topline'
})

require('nvim-treesitter').install {
    'javascript',
    'html',
    'python',
    'cpp',
    'yaml',
    'latex',
    'markdown',
    'markdown_inline',
}

-- luasnip & friendly snippets
require("luasnip.loaders.from_vscode").lazy_load({
    lazy_paths = { "./snippets" }
})

-- setup telescope
local fb_actions = require("telescope._extensions.file_browser.actions")
require('telescope').setup({
    defaults = {
        file_ignore_patterns = { '\\.git',
            '\\node_modules\\',
            'build\\',
            '\\dist\\',
            '\\release\\',
            '\\out\\',
            '\\Wix\\',
            'bin\\',
        },
    },
    extensions = {
        file_browser = {
            hijack_netrw = true,
            mappings = {
                ["i"] = {
                    ["<C-w>"] = function(prompt_bufnr) end, -- unmap C-w
                }
            }
        }
    }
})

require('mini.icons').setup() 

require('render-markdown').setup({
    heading = {
        backgrounds = {},
    },
    anti_conceal = { enabled = false },
})
