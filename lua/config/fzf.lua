-- Configuration for 'fzf-lua' plugin
--
-- References:
-- - https://github.com/ibhagwan/fzf-lua
--
--
-- ### ripgrep options:
--  `--column`: Show column number
--  `--line-number`: Show line number
--  `--no-heading`: Do not show file headings in results
--  `--fixed-strings`: Search term as a literal string
--  `--ignore-case`: Case insensitive search
--  `--no-ignore`: Do not respect .gitignore, etc...
--  `--hidden`: Search hidden files and folders
--  `--follow`: Follow symlinks
--  `--glob`: Additional conditions for search (in this case ignore everything in the .git/ folder)
--  `--color`: Search color options
--
-- Case sensitive grep:
--  `rg --column --line-number --no-heading --fixed-strings --color=always --case-sensitive --glob "!.git"`
--
-- Case insensustive grep:
--  `rg --column --line-number --no-heading --fixed-strings --color=always --ignore-case --glob "!.git"`

require('fzf-lua').setup({
    winopts = {
        preview = {
            layout = 'vertical',
        }
    },
    fzf_opts = {
        -- Case sensitive match
        -- ['+i'] = '',
        -- Enable exact-match (can be disabled by prefixing the word with ')
        ['--exact'] = '',
        -- Do not sort the result.
        -- Sort already performed by grep.
        ['--no-sort'] = '',
    },
    files = {
        -- Changes to the defaults.
        -- Added: --sort method
        rg_opts = "--color=never --files --hidden --follow -g '!.git' --sort path",
    },
    blines = {
        fzf_opts = {
            -- Sort results
            ['-s'] = '',
            -- Case sensitive
            ['+i'] = '',
        }
    },
    grep = {
        -- Changes to the defaults.
        -- Added: --sort method
        -- Removed: --smart-case
        rg_opts = "--line-number --column --no-heading --color=always --sort path",
        debug = true,
    }
})

-- Shortcuts
utils.nmap("<C-f>", ":FzfLua files<CR>")
utils.nmap("<C-g>", ":FzfLua grep_visual<CR>")
utils.nmap("<C-h>", ":FzfLua blines<CR>")
