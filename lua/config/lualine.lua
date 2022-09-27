-- Configuration for 'lualine' plugin
--
-- * https://github.com/nvim-lualine/lualine.nvim
-- * https://github.com/nvim-lualine/lualine.nvim#available-options

require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '∥', right = '∥'},
        section_separators = { left = '▶', right = '◀'},
        always_divide_middle = true,
        globalstatus = true,
        disabled_filetypes = {'alpha', 'buffergator', 'NvimTree', 'Trouble', 'toggleterm', 'Outline', 'NeogitStatus'},
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {"require('lsp-status').status()", "require('lsp-status').register_progress()"},
        lualine_x = {'encoding', 'fileformat', 'filetype'},
        lualine_y = {'progress'},
        lualine_z = {'location'}
    },
    winbar = {
        lualine_a = {'buffers'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {{'filename', path = 1}},
        lualine_y = {},
        lualine_z = {}
    },
    inactive_winbar = {
        lualine_a = {'buffers'},
        lualine_b = {},
        lualine_c = {},
        lualine_x = {{'filename', path = 1}},
        lualine_y = {},
        lualine_z = {}
    },
    extensions = {},
}
