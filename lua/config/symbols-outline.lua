-- Configuration for 'symbols-outline' plugin.
--
-- * https://github.com/simrat39/symbols-outline.nvim
-- * https://github.com/simrat39/symbols-outline.nvim#default-keymaps

-- Toggle tagbar and move focus to it when opening
utils.nmap("<F6>", ":SymbolsOutline<CR>")

require('symbols-outline').setup()
