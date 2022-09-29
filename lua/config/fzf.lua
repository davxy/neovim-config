-- Configuration for 'fzf-lua' plugin
--
-- References:
-- - https://github.com/ibhagwan/fzf-lua
--
-- ripgrep options:
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
    }
})

-- Fuzzy finder using ripgrep, smart case
utils.nmap("<C-f>", ":FzfLua grep_visual<CR>")

-- Fuzzy finder within files using ripgrep
utils.nmap("<C-g>", ":FzfLua live_grep<CR>")

-- Fuzzy finder within current buffer lines
utils.nmap("<C-h>", ":FzfLua blines<CR>")
