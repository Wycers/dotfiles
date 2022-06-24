local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    -- open_fn = function()
    --   return require("packer.util").float { border = "rounded" }
    -- end,
  },
}



return require('packer').startup(function()
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'lewis6991/impatient.nvim' -- Speed up lua scripts
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "rcarriga/nvim-notify" -- notify
  use "kyazdani42/nvim-web-devicons" -- icons


  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  
  -- Telescope
  use {
    'nvim-telescope/telescope.nvim',
    requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {
    'nvim-telescope/telescope-fzf-native.nvim', 
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }
  use "nvim-telescope/telescope-ui-select.nvim"
  use "nvim-telescope/telescope-rg.nvim"
  -- use "MattesGroeger/vim-bookmarks"
  -- use "tom-anders/telescope-vim-bookmarks.nvim"
  use "nvim-telescope/telescope-dap.nvim"
  
  -- Treesittetr
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    commit = "44b7c8100269161e20d585f24bce322f6dcdf8d2",
  }
  use {
    "nvim-treesitter/nvim-treesitter-textobjects",
    commit = "c81382328ad47c154261d1528d7c921acad5eae5",
  } -- enhance texetobject selection
  use "romgrk/nvim-treesitter-context" -- show class/function at the top
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  -- use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  -- use "RishabhRD/popfix"
  -- use "RishabhRD/nvim-lsputils"
  use "kosayoda/nvim-lightbulb" -- code action
  use "ray-x/lsp_signature.nvim" -- show function signature when typing
  -- use {
  --   "ray-x/guihua.lua",
  --   run = 'cd lua/fzy && make'
  -- }
  -- use { 'ray-x/navigator.lua' } -- super powerful plugin  for code navigation
  
  -- git
  use "lewis6991/gitsigns.nvim"

  -- file explorer 
  use {
    "kyazdani42/nvim-tree.lua",
  }
  use {
    "akinsho/bufferline.nvim", -- tab
    tag = "v1.2.0",
  }
  use "nvim-lualine/lualine.nvim" -- status line

  -- editor enhancement
  use "windwp/nvim-autopairs"
  use "akinsho/toggleterm.nvim"
  use "numToStr/Comment.nvim" -- Easily comment stuff

  use {
    "AckslD/nvim-neoclip.lua",
    config = function()
      require("neoclip").setup()
    end,
  }

  use 'anuvyklack/nvim-keymap-amend'
  use {
    'anuvyklack/pretty-fold.nvim',
    config = function()
      require('pretty-fold').setup()
      require('pretty-fold.preview').setup()
    end
  }

  -- cmp plugins
  use {
    "hrsh7th/nvim-cmp",
    -- commit = "4f1358e659d51c69055ac935e618b684cf4f1429",
  } -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"
  use "hrsh7th/cmp-nvim-lua"
  
  -- hop
  use {
    'phaazon/hop.nvim',
    branch = 'v1', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  -- whichkey
  use "folke/which-key.nvim"

  -- welcome screen
  use "goolord/alpha-nvim"

  -- project
  use "ahmedkhalf/project.nvim"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
