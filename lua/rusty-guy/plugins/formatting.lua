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
			yaml = { "biome" },
			graphql = { "biome" },
			toml = { "biome" },
			go = { "goimports", "gofmt" },
			javascript = { "biome" },
			typescript = { "biome" },
			javascriptreact = { "biome" },
			typescriptreact = { "biome" },
			json = { "biome" },
			jsx = { "biome" },
			tsx = { "biome" },
			html = { "biome" },
			css = { "biome" },
			markdown = { "biome" },
			rust = { "rustfmt" },
		},
		formatters = {
			biome = {
				command = "biome",
				args = {
					"check",
					"--write",
					"--unsafe",
					"--stdin-file-path",
					"$FILENAME",
				},
				stdin = true,
			},
		},
	},
}
