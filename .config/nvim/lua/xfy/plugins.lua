local status, packer = pcall(require, "packer")
if (not status) then
  print("Packer is not installed")
  return
end

vim.cmd [[packadd packer.nvim]]

packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'Mofiqul/dracula.nvim' -- Color scheme
  use 'nvim-lualine/lualine.nvim' -- Statusline
  use 'nvim-lua/plenary.nvim' -- Common utilities

  use 'onsails/lspkind-nvim' -- vscode-like pictograms                                          
  use 'hrsh7th/cmp-buffer' -- nvim-cmp source for buffer words
  use 'hrsh7th/cmp-nvim-lsp' -- nvim-cmp source for neovim's built-in LSP
  use 'hrsh7th/nvim-cmp' -- Completion
  use 'neovim/nvim-lspconfig' -- LSP
  use 'jose-elias-alvarez/null-ls.nvim' -- Use Neovim as a language server to inject LSP diagnos
  use 'MunifTanjim/prettier.nvim' -- Prettier plugin for Neovim's built-in LSP client

  use 'williamboman/mason.nvim'
  use 'williamboman/mason-lspconfig.nvim'

  use 'glepnir/lspsaga.nvim' -- LSP UIs                                                         
  use 'L3MON4D3/LuaSnip'
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate'
  }

  use 'kyazdani42/nvim-web-devicons' -- File icons
  use {
    'nvim-telescope/telescope.nvim',
    requires = {
       { "nvim-telescope/telescope-live-grep-args.nvim" },
    },
  }
  -- use 'nvim-telescope/telescope-file-browser.nvim'
  use 'windwp/nvim-autopairs'
  use 'windwp/nvim-ts-autotag'
  use 'norcalli/nvim-colorizer.lua'
  use 'folke/zen-mode.nvim'
  use({
    "iamcco/markdown-preview.nvim",
    run = function() vim.fn["mkdp#util#install"]() end,
  })

  use 'akinsho/nvim-bufferline.lua'
  -- use 'github/copilot.vim'

  use 'lewis6991/gitsigns.nvim'
  use 'dinhhuy258/git.nvim' -- For git blame & browse

  -- File explorer
  use {
    'kyazdani42/nvim-tree.lua',
    requires = {
      'kyzadani42/nvim-web-devicons',
    },
    tag = 'nightly'
  }

  -- Search in content
  -- use 'junegunn/fzf.vim'

  -- Motion
  use {
    'phaazon/hop.nvim',
    branch = 'v2', -- optional but strongly recommended
    config = function()
      -- you can configure Hop the way you like here; see :h hop-config
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
    end
  }

  use 'terrortylor/nvim-comment'
  use 'JoosepAlviste/nvim-ts-context-commentstring'

  use {'glepnir/dashboard-nvim'}
end)
