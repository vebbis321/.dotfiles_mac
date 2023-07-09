-- auto install packer if not installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end
local packer_bootstrap = ensure_packer() -- true if packer was just installed

-- autocommand that reloads neovim and installs/updates/removes plugins
-- when file is saved
vim.cmd([[ 
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins-setup.lua source <afile> | PackerSync
  augroup end
]])

-- import packer safely
local status, packer = pcall(require, "packer")
if not status then
  return
end

-- add list of plugins to install
return packer.startup(function(use)
  -- packer can manage itself
  use("wbthomason/packer.nvim")

  use("nvim-lua/plenary.nvim") -- lua functions that many plugins use

   -- fuzzy finding w/ telescope

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.0',
	  -- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use { "catppuccin/nvim", as = "catppuccin" }

  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
  use('theprimeagen/harpoon')

  use("christoomey/vim-tmux-navigator") -- tmux & split window navigation
  use("szw/vim-maximizer") -- maximizes and restores current window

  use("mbbill/undotree") -- git undoo
  use("tpope/vim-fugitive") -- git wrapper 

  -- use("tpope/vim-surround") -- add, delete, change surroundings (it's awesome)
  -- use("inkarkat/vim-ReplaceWithRegister") -- replace with register contents using motion (gr + motion)

   -- commenting with gc
  use("numToStr/Comment.nvim")

  -- file explorer
  use("nvim-tree/nvim-tree.lua")

  -- vs-code like icons
  use("nvim-tree/nvim-web-devicons")

  -- statusline
  use("nvim-lualine/lualine.nvim")


  -- terminal
  use {"akinsho/toggleterm.nvim", tag = '*', config = function()
      require("toggleterm").setup()
  end}

  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v1.x',
	  requires = {
		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  {'williamboman/mason.nvim'},
		  {'williamboman/mason-lspconfig.nvim'},

		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-buffer'},
		  {'hrsh7th/cmp-path'},
		  {'saadparwaiz1/cmp_luasnip'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'hrsh7th/cmp-nvim-lua'},

		  -- Snippets
		  {'L3MON4D3/LuaSnip'},
		  {'rafamadriz/friendly-snippets'},
	  }
  }

  use({
      "folke/trouble.nvim",
      config = function()
          require("trouble").setup {
              icons = false,
              -- your configuration comes here
              -- or leave it empty to use the default settings
              -- refer to the configuration section below
          }
      end
  })
  use {
       'xbase-lab/xbase',
       run = 'make install', -- or "make install && make free_space" (not recommended, longer build time)
       requires = {
           "neovim/nvim-lspconfig",
           "nvim-telescope/telescope.nvim", -- optional
           "nvim-lua/plenary.nvim", -- optional/requirement of telescope.nvim
           -- "stevearc/dressing.nvim", -- optional (in case you don't use telescope but something else)
       },
       config = function ()
           require'xbase'.setup({
               log_level = vim.log.levels.INFO,
               log_buffer = {
                   focus  = false,
                   default_direction = "horizontal",
               },
               sourcekit = {
               },
               statusline = {
                   watching = { icon = "", color = "#1abc9c" },
                   device_running = { icon = "", color = "#4a6edb" },
                   success = { icon = "", color = "#1abc9c" },
                   failure = { icon = "", color = "#db4b4b" },
               },
               simctl = {
                   iOS = {
                       "iPhone 14",
                   },
               },
               mappings = {
                   --- Whether xbase mapping should be disabled.
                   enable = true,
                   --- Open build picker. showing targets and configuration.
                   build_picker = "<leader>b", --- set to 0 to disable
                   --- Open run picker. showing targets, devices and configuration
                   run_picker = "<leader>r", --- set to 0 to disable
                   --- Open watch picker. showing run or build, targets, devices and configuration
                   watch_picker = "<leader>s", --- set to 0 to disable
                   --- A list of all the previous pickers
                   all_picker = "<leader>ef", --- set to 0 to disable
                   --- horizontal toggle log buffer
                   toggle_split_log_buffer = "<leader>ls",
                   --- vertical toggle log buffer
                   toggle_vsplit_log_buffer = "<leader>lv",
               },
           })
       end
   }

 use {
    'vimwiki/vimwiki',
    config = function()
      vim.g.vimwiki_list = {
        {
          path = '~/Documents/wimwiki/',
          syntax = 'markdown',
          ext  = '.md',
        }
      }
      vim.g.vimwiki_ext2syntax = {
        ['.md'] = 'markdown',
        ['.markdown'] = 'markdown',
        ['.mdown'] = 'markdown',
      }
    end
  }

  if packer_bootstrap then
    require("packer").sync()
  end
end)
