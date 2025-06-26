-- Install lazy.nvim if not present
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Load plugins
require('lazy').setup({
  -- Git plugins
  'tpope/vim-fugitive',
  'tpope/vim-rhubarb',

  -- Auto-detect indentation
  'tpope/vim-sleuth',

  -- Which-key for keybind hints
  { 'folke/which-key.nvim',    opts = {} },

  -- Comment toggling
  { 'numToStr/Comment.nvim',   opts = {} },
  { 'preservim/nerdcommenter', config = function() end },

  -- Auto-pairs
  { 'windwp/nvim-autopairs',   config = function() require('nvim-autopairs').setup({}) end },

  -- Wakatime
  { 'wakatime/vim-wakatime',   config = function() end },

  -- Mini.nvim suite
  { 'echasnovski/mini.nvim',   version = false },

  -- Load specific plugin configurations
  require('plugins.lsp'),
  require('plugins.completion'),
  require('plugins.treesitter'),
  require('plugins.telescope'),
  require('plugins.ui'),
  require('plugins.tools'),
}, {})

