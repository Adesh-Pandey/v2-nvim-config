-- return {
-- 	"stevearc/conform.nvim",
-- 	event = { "BufReadPre", "BufNewFile" },
-- 	config = function()
-- 		local conform = require("conform")
-- 		conform.setup({
-- 			formatters_by_ft = {
-- 				javascript = { "biome" },
-- 				typescript = { "biome" },
-- 				javascriptreact = { "biome" },
-- 				typescriptreact = { "biome" },
-- 				css = { "biome" },
-- 				html = { "biome" },
-- 				json = { "biome" },
-- 				yaml = { "biome" },
-- 				markdown = { "biome" },
-- 				graphql = { "biome" },
-- 				toml = { "biome" },
-- 				lua = { "stylua" },
-- 				go = { "gofmt" },
-- 			},
-- 			format_on_save = {
-- 				lsp_fallback = true,
-- 				async = false,
-- 				timeout_ms = 500,
-- 			},
-- 		})
-- 		conform.format({
-- 			lsp_fallback = true,
-- 			async = false,
-- 			timeout_ms = 500,
-- 		})
-- 		vim.keymap.set(
-- 			{
-- 				"n",
-- 				"v",
-- 			},
-- 			"<leader>mp",
-- 			function()
-- 				conform.format({
-- 					lsp_fallback = true,
-- 					async = false,
-- 					timeout_ms = 500,
-- 				})
-- 			end
-- 		)
-- 	end,
-- }
--
--
return { -- Autoformat
	"stevearc/conform.nvim",
	event = { "BufWritePre" },
	cmd = { "ConformInfo" },
	keys = {
		{
			"<leader>mp",
			function()
				require("conform").format({ async = true, lsp_format = "never" })
			end,
			mode = "",
			desc = "[F]ormat buffer",
		},
	},
	opts = {
		notify_on_error = false,
		format_on_save = function(bufnr)
			local lsp_format_opt = "never"
			return {
				timeout_ms = 500,
				lsp_format = lsp_format_opt,
			}
		end,
		formatters_by_ft = {
			lua = { "stylua" },
			javascript = { "biome", "biome-organize-imports" },
			javascriptreact = { "biome", "biome-organize-imports" },
			typescript = { "biome", "biome-organize-imports" },
			typescriptreact = { "biome", "biome-organize-imports" },
			css = { "biome", "biome-organize-imports" },
			html = { "biome", "biome-organize-imports" },
			json = { "biome", "biome-organize-imports" },
			yaml = { "biome", "biome-organize-imports" },
			markdown = { "biome", "biome-organize-imports" },
			graphql = { "biome", "biome-organize-imports" },
			toml = { "biome", "biome-organize-imports" },
			go = { "goimports", "gofmt" },
			rust = { "rustfmt" },
		},
	},
}
