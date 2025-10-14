-- import nvim-treesitter plugin safely
local status, treesitter = pcall(require, "nvim-treesitter.configs")
if not status then
	return
end

-- configure treesitter
treesitter.setup({
	-- enable syntax highlighting
	highlight = {
		enable = true,
	},
	-- enable indentation
	indent = { enable = true },
	-- ensure these language parsers are installed
	ensure_installed = {
		"json",
		"javascript",
		"typescript",
		"tsx",
		"yaml",
		"html",
		"css",
		"markdown",
		"markdown_inline",
		"svelte",
		"graphql",
		"bash",
		"lua",
		"vim",
		"dockerfile",
		"gitignore",
		"rust",
		"go",
		"sql",
	},
	-- auto install above language parsers
	auto_install = true,
})

-- configure nvim-ts-autotag separately
local autotag_status, autotag = pcall(require, "nvim-ts-autotag")
if autotag_status then
	autotag.setup()
end
