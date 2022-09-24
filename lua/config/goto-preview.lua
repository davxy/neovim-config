-- Configuration for goto-preview plugin
--
-- The plugin is augmented to allow open the current preview
-- floating window as a normal tab.

-- Export module globally
_G.goto_preview = require('goto-preview')

local open_stack = {}

local function post_open()
    local curr = vim.api.nvim_get_current_buf()
    table.insert(open_stack, curr)
end

local function open()
    local filename = vim.api.nvim_buf_get_name(0)
    local row, col = unpack(vim.api.nvim_win_get_cursor(0))

    goto_preview.close()

    vim.cmd("tabnew " .. filename)
    vim.api.nvim_win_set_cursor(0, { row, col })
end

local function close()
    -- Cleanup stacked previews buffers
    for _, buf in ipairs(open_stack) do
        if vim.api.nvim_buf_is_valid(buf) then
            vim.api.nvim_buf_delete(buf, { force = true })
        end
    end
    open_stack = {}
    -- Is this really required?
    goto_preview.close_all_win()
end

goto_preview.setup({
    post_open_hook = post_open,
    force_close = true,
})

-- Bind custom functions to the module
goto_preview.preview = goto_preview.goto_preview_definition
goto_preview.open = open
goto_preview.close = close

-- Shortcuts
utils.nmap("gtp", ":lua goto_preview.preview()<CR>")
utils.nmap("gto", ":lua goto_preview.open()<CR>")
utils.nmap("gtc", ":lua goto_preview.close()<CR>")
