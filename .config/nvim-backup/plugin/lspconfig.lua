-- vim.lsp.set_log_level("debug")
local status, nvim_lsp = pcall(require, "lspconfig")
if not status then
	return
end

-- import cmp-nvim-lsp plugin safely
local cmp_nvim_lsp_status, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not cmp_nvim_lsp_status then
	return
end

-- import typescript plugin safely
local typescript_setup, typescript = pcall(require, "typescript")
if not typescript_setup then
	return
end

local rust_status, rust = pcall(require, "rust-tools")
if not rust_status then
	return
end

local protocol = require("vim.lsp.protocol")

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
	local function buf_set_keymap(...)
		vim.api.nvim_buf_set_keymap(bufnr, ...)
	end

	local function buf_set_option(...)
		vim.api.nvim_buf_set_option(bufnr, ...)
	end

	--Enable completion triggered by <c-x><c-o>
	buf_set_option("omnifunc", "v:lua.vim.lsp.omnifunc")

	-- Mappings.
	local opts = { noremap = true, silent = true }

	-- See `:help vim.lsp.*` for documentation on any of the below functions
	buf_set_keymap("n", "gD", "<Cmd>lua vim.lsp.buf.declaration()<CR>", opts)
	--buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
	buf_set_keymap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
	--buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
end

protocol.CompletionItemKind = {
	"", -- Text
	"", -- Method
	"", -- Function
	"", -- Constructor
	"", -- Field
	"", -- Variable
	"", -- Class
	"ﰮ", -- Interface
	"", -- Module
	"", -- Property
	"", -- Unit
	"", -- Value
	"", -- Enum
	"", -- Keyword
	"﬌", -- Snippet
	"", -- Color
	"", -- File
	"", -- Reference
	"", -- Folder
	"", -- EnumMember
	"", -- Constant
	"", -- Struct
	"", -- Event
	"ﬦ", -- Operator
	"", -- TypeParameter
}

-- used to enable autocompletion (assign to every lsp server config)
local capabilities = cmp_nvim_lsp.default_capabilities()

nvim_lsp.flow.setup({
	on_attach = on_attach,
	capabilities = capabilities,
})

-- organize imports
local function organize_imports()
	local params = {
		command = "_typescript.organizeImports",
		arguments = { vim.api.nvim_buf_get_name(0) },
		title = "",
	}
	vim.lsp.buf.execute_command(params)
end
vim.keymap.set("n", "<S-A-o>", organize_imports)

-- nvim_lsp.tsserver.setup({
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	commands = {
-- 		OrganizeImports = {
-- 			organize_imports,
-- 			description = "Organize Imports",
-- 		},
-- 	},
-- })

nvim_lsp.sourcekit.setup({
	on_attach = on_attach,
})

nvim_lsp.lua_ls.setup({
	on_attach = on_attach,
	settings = {
		Lua = {
			diagnostics = {
				-- Get the language server to recognize the `vim` global
				globals = { "vim" },
			},

			workspace = {
				-- Make the server aware of Neovim runtime files
				library = vim.api.nvim_get_runtime_file("", true),
				checkThirdParty = false,
			},
		},
	},
})

-- configure html server
nvim_lsp["html"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- configure typescript server with plugin
typescript.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
		root_dir = nvim_lsp.util.root_pattern("package.json"),
	},
})

-- Deno
nvim_lsp.denols.setup({
	capabilities = capabilities,
	on_attach = on_attach,
	root_dir = nvim_lsp.util.root_pattern("deno.json", "deno.jsonc"),
})

-- configure css server
nvim_lsp["cssls"].setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- tailwindcss
nvim_lsp.tailwindcss.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- python
nvim_lsp.pylsp.setup({
	capabilities = capabilities,
	on_attach = on_attach,
})

-- nvim_lsp.rust_analyzer.setup({
-- 	capabilities = capabilities,
-- 	on_attach = on_attach,
-- })

-- rust
rust.setup({
	server = {
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			["rust-analyzer"] = {
				cargo = {
					allFeatures = true,
				},
				checkOnSave = {
					allFeatures = true,
					command = "clippy",
				},
				procMacro = {
					ignored = {
						-- ["async-trait"] = { "async_trait" },
						-- ["napi-derive"] = { "napi" },
						-- ["async-recursion"] = { "async_recursion" },
					},
				},
			},
		},
	},
})

vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(vim.lsp.diagnostic.on_publish_diagnostics, {
	underline = true,
	update_in_insert = false,
	virtual_text = { spacing = 4, prefix = "●" },
	severity_sort = true,
})

-- Diagnostic symbols in the sign column (gutter)
-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- for type, icon in pairs(signs) do
-- 	local hl = "DiagnosticSign" .. type
-- 	vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
-- end

vim.diagnostic.config({
	virtual_text = {
		prefix = "●",
	},
	update_in_insert = true,
	float = {
		source = "always", -- Or "if_many"
	},
})
