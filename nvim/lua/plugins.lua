local M = {}

function M.setup()
  -- Indicate first time installation
  local packer_bootstrap = false

  -- packer.nvim configuration
  local conf = {
    display = {
      open_fn = function()
        return require("packer.util").float { border = "rounded" }
      end,
    },
  }

  -- Check if packer.nvim is installed
  -- Run PackerCompile if there are changes in this file
  local function packer_init()
    local fn = vim.fn
    local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
    if fn.empty(fn.glob(install_path)) > 0 then
      packer_bootstrap = fn.system {
        "git",
        "clone",
        "--depth",
        "1",
        "https://github.com/wbthomason/packer.nvim",
        install_path,
      }
      vim.cmd [[packadd packer.nvim]]
    end
    vim.cmd "autocmd BufWritePost plugins.lua source <afile> | PackerCompile"
  end

  -- Plugins
  local function plugins(use)
    use { "wbthomason/packer.nvim" }

    -- Colorscheme
    use {
      "catppuccin/nvim",
      as = "catppuccin",
      config = function()
        require("config.catppuccin").setup()
      end,
    }

    -- Startup screen
    use {
      "goolord/alpha-nvim",
      config = function()
        require("config.alpha").setup()
      end,
    }

    -- Telescope
    use {
      "nvim-telescope/telescope.nvim",
      tag = "0.1.0",
      requires = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope-ui-select.nvim",
      },
      config = function()
        require("config.telescope").setup()
      end,
    }

    use {
      "nvim-telescope/telescope-ui-select.nvim",
    }

    -- Treesitter
    use {
      "nvim-treesitter/nvim-treesitter",
      config = function()
        require("config.treesitter").setup()
      end,
    }

    -- Lsp
    use {
      "neovim/nvim-lspconfig",
      config = function()
        require("config.lsp.lsp").setup()
      end,
    }

    -- Jinja
    use {
      "Glench/Vim-Jinja2-Syntax"
    }

    -- Helm
    use {
      "towolf/vim-helm"
    }

    -- Snippet
    use {
      "L3MON4D3/LuaSnip",
      tag = "v1.*",
      requires = {
        "saadparwaiz1/cmp_luasnip",
      },
      config = function()
        require("config.luasnip").setup()
      end,
    }

    -- Completion
    use {
      "hrsh7th/nvim-cmp",
      requires = {
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-cmdline",
        "L3MON4D3/LuaSnip",
      },
      config = function()
        require("config.cmp").setup()
      end,
    }

    -- Status line
    use {
      "nvim-lualine/lualine.nvim",
      requires = {
        "kyazdani42/nvim-web-devicons",
      },
      config = function()
        require("config.lualine").setup()
      end,
    }

    -- Notification
    use {
      "rcarriga/nvim-notify",
      config = function()
        require("config.notify").setup()
      end,
    }

    if packer_bootstrap then
      print "Restart Neovim required after installation!"
      require("packer").sync()
    end
  end

  packer_init()

  local packer = require "packer"
  packer.init(conf)
  packer.startup(plugins)
end

return M
