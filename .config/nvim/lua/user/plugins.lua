-- Automatically install lazy
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup lazy_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | Lazy sync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  vim.notify("Could not find lazy.")
  return
end

-- Install your plugins here
return lazy.setup({
  -- My plugins here
  "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
  "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins

  -- Colorschemes
  "folke/tokyonight.nvim",
  { 'rose-pine/neovim', name = 'rose-pine' },
  "ellisonleao/gruvbox.nvim",
  "rebelot/kanagawa.nvim",
  "lunarvim/darkplus.nvim",

  -- cmp plugins
  "hrsh7th/nvim-cmp", -- Completion plugin
  "hrsh7th/cmp-buffer", -- Buffer completions
  "hrsh7th/cmp-path", -- Path completions
  "hrsh7th/cmp-cmdline", -- cmdline completions
  "hrsh7th/cmp-nvim-lsp",
  "saadparwaiz1/cmp_luasnip", -- snippet completions

  -- snippets
  "L3MON4D3/LuaSnip",  -- snippet engine
  "rafamadriz/friendly-snippets",  -- lots of snippets

  -- LSP
  "neovim/nvim-lspconfig", -- enable LSP
  "williamboman/mason.nvim", -- simple to use language server installer
  "williamboman/mason-lspconfig.nvim", -- simple to use language server installer
  "jose-elias-alvarez/null-ls.nvim", -- LSP diagnostics and code actions

  -- Telescope (fuzzy finder)
  "nvim-telescope/telescope.nvim",
  "nvim-telescope/telescope-media-files.nvim",

  -- Treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
  },
  "HiPhish/nvim-ts-rainbow2",  -- colour brackets
  "nvim-treesitter/playground",
  "windwp/nvim-autopairs", -- auto close brackets/quotes
  "windwp/nvim-ts-autotag",  -- autoclose/rename tags
  "RRethy/nvim-treesitter-endwise",  -- smart end in languages like lua

  -- Markdown Previewer
  {
    "iamcco/markdown-preview.nvim",
    build = "cd app && yarn install",
    ft = "markdown",
    -- cmd = "MarkdownPreview", -- Not working?
  },
})
