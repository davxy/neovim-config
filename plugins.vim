"------------------------------------------------------------------------------
" VimPlug
"------------------------------------------------------------------------------

call plug#begin("~/.config/nvim/plugged")

"-------------------------------------------------------------------------------
" General
"-------------------------------------------------------------------------------

" Library of lua functions used by other plugins
" (diffview.nvim, ...)
Plug 'nvim-lua/plenary.nvim'

" File explorer with git and icons support
Plug 'kyazdani42/nvim-tree.lua'

" Fuzzy finder
Plug 'ibhagwan/fzf-lua'

" Bookmarks
Plug 'MattesGroeger/vim-bookmarks'

" General buffers management
Plug 'jeetsukumaran/vim-buffergator'

" Easy way to delete buffers
Plug 'Asheq/close-buffers.vim'

" Terminal management
Plug 'akinsho/toggleterm.nvim'

" Syntax highlight and folding
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

" Better folding management
Plug 'kevinhwang91/nvim-ufo'
Plug 'kevinhwang91/promise-async'

" Unicode search utilities
Plug 'chrisbra/unicode.vim'

" Nice view while switching between buffers
Plug 'ghillb/cybu.nvim'

" Autopair with support for multiple characters
Plug 'windwp/nvim-autopairs'

" Dynamic scroll offset
Plug 'drzel/vim-scrolloff-fraction'

" Session manager
Plug 'Shatur/neovim-session-manager'

"-------------------------------------------------------------------------------
" Look and Feel
"-------------------------------------------------------------------------------

" Color schemes
Plug 'ellisonleao/gruvbox.nvim'
Plug 'sainnhe/gruvbox-material'
Plug 'folke/tokyonight.nvim'

" Startup screen
Plug 'goolord/alpha-nvim'

" Status and tabline
Plug 'nvim-lualine/lualine.nvim'

" Development icons
Plug 'kyazdani42/nvim-web-devicons'

" Center text on screen
Plug 'junegunn/goyo.vim'

" Text highlight
Plug 'junegunn/limelight.vim'

"-------------------------------------------------------------------------------
" Git
"-------------------------------------------------------------------------------

" Git diff viewer
Plug 'sindrets/diffview.nvim'

" Git plugin
Plug 'tpope/vim-fugitive'

" Git diff in gutter and some hunk utilities
Plug 'lewis6991/gitsigns.nvim'

" 'Magit' clone for neovim
Plug 'TimUntersberger/neogit'

" Utility to resolve git conflicts
Plug 'akinsho/git-conflict.nvim'

"-------------------------------------------------------------------------------
" Development
"-------------------------------------------------------------------------------

" Collection of common configurations for nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Completion framework
Plug 'hrsh7th/nvim-cmp'
" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
" Completion source for buffer words
Plug 'hrsh7th/cmp-buffer'
" Completion source for filesystem paths
Plug 'hrsh7th/cmp-path'
" Completion source for command line
Plug 'hrsh7th/cmp-cmdline'
" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'
" Snippet engine
Plug 'hrsh7th/vim-vsnip'

" Generation status line components from the built-in LSP client
Plug 'nvim-lua/lsp-status.nvim'

" Source previews in float windows
Plug 'rmagatti/goto-preview'

" Source symbols browser
Plug 'simrat39/symbols-outline.nvim'

" Syntax notificaitons
Plug 'folke/trouble.nvim'

" Code comments shortcuts
Plug 'tpope/vim-commentary'

" Debugger console support for lldb and gdb
Plug 'sakhnik/nvim-gdb'

" Highlight todo, warn, xxx within comments
Plug 'folke/todo-comments.nvim'

" Official Rust plugin
Plug 'rust-lang/rust.vim'

" To enable more of the features of rust-analyzer, such as inlay hints and more
Plug 'simrat39/rust-tools.nvim'

" Rust crates tool
Plug 'saecki/crates.nvim'

call plug#end()
