-- Configuration for 'lualine' plugin
--
-- * https://github.com/nvim-lualine/lualine.nvim
-- * https://github.com/nvim-lualine/lualine.nvim#available-options

-- Macro recording log (useful if cmdheight=0)
local function show_macro_recording()
    local reg = vim.fn.reg_recording()
    if reg == "" then
        return ""
    else
        return "🖭  @" .. reg
    end
end


require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '∥', right = '∥'},
        section_separators = { left = '▶', right = '◀'},
        always_divide_middle = true,
        globalstatus = true,
        disabled_filetypes = utils.masked_filetypes,
    },
    sections = {
        lualine_a = {'mode'},
        lualine_b = {'branch', 'diff', 'diagnostics'},
        lualine_c = {"require('lsp-status').status()", "require('lsp-status').register_progress()"},
        lualine_x = {
            {
                "macro-recording",
                fmt = show_macro_recording,
            },
            'encoding', 'fileformat', 'filetype'
        },
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

vim.api.nvim_create_autocmd("RecordingEnter", {
    callback = function()
        require('lualine').refresh({
            place = { "statusline" },
        })
    end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
    callback = function()
        -- This is going to seem really weird!
        -- Instead of just calling refresh we need to wait a moment because of the nature of
        -- `vim.fn.reg_recording`. If we tell lualine to refresh right now it actually will
        -- still show a recording occuring because `vim.fn.reg_recording` hasn't emptied yet.
        -- So what we need to do is wait a tiny amount of time (in this instance 50 ms) to
        -- ensure `vim.fn.reg_recording` is purged before asking lualine to refresh.
        local timer = vim.loop.new_timer()
        timer:start(
            50,
            0,
            vim.schedule_wrap(function()
                require('lualine').refresh({
                    place = { "statusline" },
                })
            end)
        )
    end,
})
