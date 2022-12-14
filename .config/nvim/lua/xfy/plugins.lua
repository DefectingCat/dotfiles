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

return packer.startup({
	function(use)
		use("wbthomason/packer.nvim")

		-- UIs
		use("Mofiqul/dracula.nvim") -- Color scheme
		use("nvim-lualine/lualine.nvim") -- Statusline
		use("nvim-lua/plenary.nvim") -- Common utilities
		use("akinsho/nvim-bufferline.lua")
		use("petertriho/nvim-scrollbar")
		use({
			"kevinhwang91/nvim-hlslens",
			config = function()
				-- require('hlslens').setup() is not required
				require("scrollbar.handlers.search").setup({
					-- hlslens config overrides
				})
			end,
		})

		-- terminal & window
		use("szw/vim-maximizer") -- maximizs and restore current window
		use({ "akinsho/toggleterm.nvim" })
		-- surround
		use({
			"ur4ltz/surround.nvim",
			config = function()
				require("surround").setup({ mappings_style = "surround" })
			end,
		})

		-- autocompletion
		use("hrsh7th/nvim-cmp") -- Completion
		use("hrsh7th/cmp-vsnip")
		use("hrsh7th/cmp-path") -- { name = 'path' }
		use("hrsh7th/cmp-cmdline") -- { name = 'cmdline' }
		use("hrsh7th/cmp-nvim-lsp-signature-help") -- { name = 'nvim_lsp_signature_help' }
		use("hrsh7th/cmp-buffer") -- nvim-cmp source for buffer words
		use("hrsh7th/cmp-nvim-lsp") -- nvim-cmp source for neovim's built-in LSP

		-- snippets
		use("L3MON4D3/LuaSnip") -- snippet engine
		use("saadparwaiz1/cmp_luasnip") -- for autocompletion
		use("rafamadriz/friendly-snippets")

		-- LSPs
		use("neovim/nvim-lspconfig") -- LSP
		use("onsails/lspkind-nvim") -- vscode-like pictograms
		use({ "glepnir/lspsaga.nvim", branch = "main" }) -- enhanced lsp uis
		use("jose-elias-alvarez/typescript.nvim") -- additional functionality for typescript server (e.g. rename file & update imports)
		use("simrat39/rust-tools.nvim") -- rust

		-- formatting & linting
		use("jose-elias-alvarez/null-ls.nvim") -- Use Neovim as a language server to inject LSP diagnos
		use("jayp0521/mason-null-ls.nvim") -- bridges gap b/w mason & null-ls
		use("gpanders/editorconfig.nvim") -- editor config

		-- managing & installing lsp servers, linters & formatters
		use("williamboman/mason.nvim")
		use("williamboman/mason-lspconfig.nvim")

		-- treesitter configuration
		use({
			"nvim-treesitter/nvim-treesitter",
			run = ":TSUpdate",
			-- run = function()
			-- 	require("nvim-treesitter.install").update({ with_sync = true })
			-- end,
		})

		use("kyazdani42/nvim-web-devicons") -- File icons
		use({
			"nvim-telescope/telescope.nvim",
			requires = {
				{ "nvim-telescope/telescope-live-grep-args.nvim" },
			},
		})
		use("windwp/nvim-autopairs")
		use("windwp/nvim-ts-autotag")
		use("norcalli/nvim-colorizer.lua")

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

		-- MDX
		use("jxnblk/vim-mdx-js")

		if packer_bootstrap then
			require("packer").sync()
		end
	end,
	config = {
		-- ?????????????????????snapshots??????
		-- snapshot_path = require("packer.util").join_paths(vim.fn.stdpath("config"), "snapshots"),
		-- ???????????????????????????v1???????????????????????????
		-- snapshot = "v1",

		-- ???????????????
		max_jobs = 16,
		-- ????????????
		git = {
			-- default_url_format = "https://hub.fastgit.xyz/%s",
			-- default_url_format = "https://mirror.ghproxy.com/https://github.com/%s",
			-- default_url_format = "https://gitcode.net/mirrors/%s",
			-- default_url_format = "https://gitclone.com/github.com/%s",
		},
		-- display = {
		-- ????????????????????????
		--   open_fn = function()
		--     return require("packer.util").float({ border = "single" })
		--   end,
		-- },
	},
})
