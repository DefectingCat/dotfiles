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

local packer_bootstrap = ensure_packer()

vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerCompile
  augroup end
]])

local status, packer = pcall(require, "packer")
if not status then
	return
end

return packer.startup(function(use)
	use("wbthomason/packer.nvim")

	use("Mofiqul/dracula.nvim") -- Color scheme
	use("nvim-lualine/lualine.nvim") -- Statusline
	use("nvim-lua/plenary.nvim") -- Common utilities

	-- terminal & window
	use("szw/vim-maximizer") -- maximizs and restore current window

	-- text
	-- use 'tpope/vim-surround'

	-- autocompletion
	use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
	use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP
	use("hrsh7th/nvim-cmp") -- Completion

	-- snippets
	use("L3MON4D3/LuaSnip") -- snippet engine
	use("saadparwaiz1/cmp_luasnip") -- for autocompletion
	use("rafamadriz/friendly-snippets")

	-- LSPs
	use("neovim/nvim-lspconfig") -- LSP
	use("onsails/lspkind-nvim") -- vscode-like pictograms
	use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
	use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)

	-- formatting & linting
	use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnos
	use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls

	-- managing & installing lsp servers, linters & formatters
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")

	-- treesitter configuration
	use({
		"nvim-treesitter/nvim-treesitter",
		run = function()
			require("nvim-treesitter.install").update({ with_sync = true })
		end,
	})

	use("kyazdani42/nvim-web-devicons") -- File icons
	use({
		"nvim-telescope/telescope.nvim",
		requires = {
			{ "nvim-telescope/telescope-live-grep-args.nvim" },
		},
	})
	-- use 'nvim-telescope/telescope-file-browser.nvim'
	use("windwp/nvim-autopairs")
	use("windwp/nvim-ts-autotag")
	use("norcalli/nvim-colorizer.lua")
	use({
		"iamcco/markdown-preview.nvim",
		run = function()
			vim.fn["mkdp#util#install"]()
		end,
	})

	use("akinsho/nvim-bufferline.lua")

	-- git intergation
	use("lewis6991/gitsigns.nvim")

	-- File explorer
	use({
		"kyazdani42/nvim-tree.lua",
		requires = {
			"kyzadani42/nvim-web-devicons",
		},
		tag = "nightly",
	})

	-- Motion
	use({
		"phaazon/hop.nvim",
		branch = "v2", -- optional but strongly recommended
		config = function()
			-- you can configure Hop the way you like here; see :h hop-config
			require("hop").setup({ keys = "etovxqpdygfblzhckisuran" })
		end,
	})

	use({ "glepnir/dashboard-nvim" })

	-- multi cursor
	use("mg979/vim-visual-multi")

	-- Comment
	use("terrortylor/nvim-comment")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- function doc
	use({
		"kkoomen/vim-doge",
		run = ":call doge#install()",
	})

	-- Display image in editor
	-- use({ "edluffy/hologram.nvim" })

	-- MDX
	use("jxnblk/vim-mdx-js")

	if packer_bootstrap then
		require("packer").sync()
	end
end)
