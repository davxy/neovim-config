-- Configuration for 'fzf' plugin
--
-- References:
-- - https://github.com/junegunn/fzf.vim
-- - https://dev.to/iggredible/how-to-search-faster-in-vim-with-fzf-vim-36ko

-- Fuzzy finder using ripgrep, case insensitive
utils.nmap("<C-f>", ":Rgf<CR>")

-- Fuzzy finder within files using ripgrep
utils.nmap("<C-g>", ":Rgi<CR>")

-- Fuzzy finder within current buffer lines
utils.nmap("<C-h>", ":BLines<CR>")

-- Preview window position
-- >>> 'CTRL-/' will toggle preview window.
-- Note that this array is passed as arguments to fzf#vim#with_preview function.
-- To learn more about preview window options, see `--preview-window` section of `man fzf`.
vim.g.fzf_preview_window = {'up:50%', 'ctrl-/'}

-- 'Commit' command format
vim.g.fzf_commits_log_options = '--graph --color=always --format="%C(red)%h%C(reset) -%C(yellow)%d%C(reset) %s %C(bold green)<%an>%C(reset) %C(blue)(%cr)"'

-- ripgrep options:
-- `--column`: Show column number
-- `--line-number`: Show line number
-- `--no-heading`: Do not show file headings in results
-- `--fixed-strings`: Search term as a literal string
-- `--ignore-case`: Case insensitive search
-- `--no-ignore`: Do not respect .gitignore, etc...
-- `--hidden`: Search hidden files and folders
-- `--follow`: Follow symlinks
-- `--glob`: Additional conditions for search (in this case ignore everything in the .git/ folder)
-- `--color`: Search color options

-- Case sensitive ripgrep.
--
-- By default rg also searches for file name in addition to the phrase.
-- This only search within the file content.
--
-- TODO: Port this to proper lua code...
vim.api.nvim_exec([[
    command! -bang -nargs=* Rgf
    \ call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --color=always --case-sensitive --glob "!.git" '.shellescape(<q-args>),
    \ 1,
    \ fzf#vim#with_preview({'options': '+i +s --tac -e --delimiter : --nth 4..'}),
    \ <bang>0)
]], false)

-- Case insensitive ripgrep.
--
-- By default rg also searches for file name in addition to the phrase.
-- This only search within the file content.
--
-- TODO: Port this to proper lua code...
vim.api.nvim_exec([[
    command! -bang -nargs=* Rgi
        \ call fzf#vim#grep(
        \ 'rg --column --line-number --no-heading --fixed-strings --color=always --ignore-case --glob "!.git" '.shellescape(<q-args>),
        \ 1,
        \ fzf#vim#with_preview({'options': '-i +s --tac -e --delimiter : --nth 4..'}),
        \ <bang>0)
]], false)
