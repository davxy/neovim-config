--
-- Plugins configuration and setup
--

-- Session manager plugin setup
require('session_manager').setup {
    autoload_mode = require('session_manager.config').AutoloadMode.Disabled,
    -- Do not automatically create sessions.
    -- Nevertheless, existing sessions are automatically saved on exit.
    autosave_only_in_session = true,
}

-- Autopairs plugin setup
require('nvim-autopairs').setup({
    fast_wrap = {
        map = '<C-e>',
    },
})

-- Cybu plugin setup
require('cybu').setup {
    behavior = {
        mode = {
            default = {
                view = "paging",
            }
        }
    }
}

require('config.nvim-tree')
require('config.lualine')
require('config.bookmarks')
require('config.buffergator')
require('config.toggleterm')
require('config.fzf')
require('config.limelight')
require('config.treesitter')
require('config.nvim-ufo')
require('config.gitsigns')
require('config.neogit')
require('config.git-conflict')
require('config.nvim-gdb')
require('config.lspconfig')
require('config.rust-tools')
require('config.cmp')
require('config.trouble')
require('config.symbols-outline')
require('config.gruvbox')
require('config.todo-comments')
require('config.alpha')
require('config.goto-preview')
require('config.crates')

--
-- Further configs
--

-- Customize diagnostics
-- https://neovim.io/doc/user/diagnostic.html
vim.diagnostic.config({
    -- Use signs for diagnostic (default: true)
    signs = true,
    -- Don't underline diagnostics (default: true)
    underline = false,
    -- Don't show virtual text for diagnostics (default: true)
    -- We rely on LSP pop-ups
    virtual_text = false,
    -- Update only on insert leave (default: false)
    update_in_insert = false,
    -- Sort diagnostics by severity (default: false)
    -- E.g. ERROR before WARN
    severity_sort = true,
})

-- Customize diagnostic symbols
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

-- Disable 'lsp-status' plugin diagnostics
-- This is because we already showing diagnostics icons using the functionality
-- built into 'lualine' plugin.
require('lsp-status').config({ diagnostics = false })
