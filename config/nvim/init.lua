-- Install packer
local install_path = os.getenv('HOME') .. '/nix-neovim/local/share/nvim/packer.nvim'

if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  vim.fn.execute('!git clone https://github.com/wbthomason/packer.nvim ' .. install_path)
end

vim.cmd [[
set runtimepath-=~/.config/nvim
set runtimepath-=~/.config/nvim/after
set runtimepath-=~/.local/share/nvim/site
set runtimepath-=~/.local/share/nvim/site/after

set runtimepath+=~/nix-neovim/config/nvim/after
set runtimepath^=~/nix-neovim/config/nvim
set runtimepath+=~/nix-neovim/local/share/nvim/site/after
set runtimepath^=~/nix-neovim/local/share/nvim/site

set packpath-=~/.config/nvim
set packpath-=~/.config/nvim/after
set packpath-=~/.local/share/nvim/site
set packpath-=~/.local/share/nvim/site/after

set packpath^=~/nix-neovim/config/nvim
set packpath+=~/nix-neovim/config/nvim/after
set packpath^=~/nix-neovim/local/share/nvim/site
set packpath+=~/nix-neovim/local/share/nvim/site/after
]]

vim.api.nvim_exec(
  [[
  augroup Packer
    autocmd!
    autocmd BufWritePost init.lua PackerCompile
    augroup end
]],
  false
)
-- Why do this? https://dev.to/creativenull/installing-neovim-nightly-alongside-stable-10d0
-- A little more context, if you have a different location for your init.lua outside ~/.config/nvim
-- in my case, this is ~/nix-neovim/config/nvim - you may want to set a custom location for packer
local packer = require 'packer'
packer.init {
  package_root = os.getenv('HOME') .. '/nix-neovim/local/share/nvim/site/pack',
  compile_path = os.getenv('HOME') .. '/nix-neovim/config/nvim/plugin/packer_compiled.vim'
}

local use = require('packer').use
require('packer').startup(function()
  use 'wbthomason/packer.nvim' -- Package manager
  use 'tpope/vim-fugitive' -- Git commands in nvim
  use 'tpope/vim-rhubarb' -- Fugitive-companion to interact with github
  use 'tpope/vim-commentary' -- "gc" to comment visual regions/lines
  use 'tpope/vim-sensible'
  use 'tpope/vim-unimpaired'
  use 'tpope/vim-surround'
  use 'tpope/vim-rsi'
  use 'christoomey/vim-tmux-navigator'
  use 'roxma/vim-tmux-clipboard'
  -- use 'ludovicchabant/vim-gutentags' -- Automatic tags management
  -- UI to select things (files, grep results, open buffers...)
  use { 'nvim-telescope/telescope.nvim', requires = { { 'nvim-lua/popup.nvim' }, { 'nvim-lua/plenary.nvim' } } }
  -- themes --
  use 'joshdick/onedark.vim' -- Theme inspired by Atom
  use 'morhetz/gruvbox'
  use 'dracula/vim'
  use 'itchyny/lightline.vim' -- Fancier statusline
  -- Add indentation guides even on blank lines
  use 'lukas-reineke/indent-blankline.nvim'
  -- Add git related info in the signs columns and popups
  use { 'lewis6991/gitsigns.nvim', requires = { 'nvim-lua/plenary.nvim' } }
  -- Highlight, edit, and navigate code using a fast incremental parsing library
  use 'nvim-treesitter/nvim-treesitter'
  -- Additional textobjects for treesitter
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'neovim/nvim-lspconfig' -- Collection of configurations for built-in LSP client
  use 'hrsh7th/nvim-compe' -- Autocompletion plugin
  use 'L3MON4D3/LuaSnip' -- Snippets plugin
  -- formatters
  use 'andrejlevkovitch/vim-lua-format'
end)

vim.cmd [[colorscheme gruvbox]]

vim.cmd [[
set nobackup
set nowritebackup
set noswapfile
]]
