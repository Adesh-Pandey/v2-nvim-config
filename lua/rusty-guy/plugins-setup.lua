vim.g.mapleader = " "
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)
-- vim.cmd([[autocmd ColorScheme * highlight Normal ctermbg=NONE guibg=NONE]])

local status, lazy = pcall(require, "lazy")
if not status then
	return
end

return lazy.setup({
	{ "akinsho/bufferline.nvim", version = "*", dependencies = "nvim-tree/nvim-web-devicons" },
	-- "bluz71/vim-nightfly-guicolors", -- theme
	"karb94/neoscroll.nvim",
	-- "github/copilot.vim",
	"junegunn/fzf",
	-- "scottmackendry/cyberdream.nvim",
	"Mofiqul/vscode.nvim",
	"nvim-lua/plenary.nvim",
	"ThePrimeagen/harpoon",
	{ "rose-pine/neovim", name = "rose-pine" },
	"oxfist/night-owl.nvim",
	{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
	"christoomey/vim-tmux-navigator", -- to navigate between split window
	"szw/vim-maximizer", -- toggle size of split window
	"catppuccin/nvim",
	"folke/tokyonight.nvim",
	"tpope/vim-surround", -- wrap with characters
	"vim-scripts/ReplaceWithRegister", -- replace by coping

	"numToStr/Comment.nvim", -- commenting

	"nvim-tree/nvim-tree.lua", -- explorer
	-- fuzzy finding w/ telescope
	{ "nvim-telescope/telescope.nvim", dependencies = { "tsakirist/telescope-lazy.nvim", "nvim-lua/plenary.nvim" } },
	-- snippets
	-- "L3MON4D3/LuaSnip", -- snippet engine
	{ "saadparwaiz1/cmp_luasnip", dependencies = { "rafamadriz/friendly-snippets" } }, -- for autocomple  "rafamadriz/friendly-snippets", -- useful snippets

	-- managing & installing lsp servers, linters & formatters

	"L3MON4D3/LuaSnip",
	{
		"williamboman/mason.nvim",
		dependencies = {
			"WhoIsSethDaniel/mason-tool-installer.nvim",
			"williamboman/mason-lspconfig.nvim",
		},
	}, -- in charge of managing lsp servers, linters & formatters

	-- configuring lsp servers
	"neovim/nvim-lspconfig", -- easily configure language servers
	"hrsh7th/cmp-nvim-lsp", -- for autocompletion

	-- need to set this uo
	{ "simrat39/rust-tools.nvim", ft = "rust", opts = function() end },
	"hrsh7th/nvim-cmp",
	{
		"rust-lang/rust.vim",
		ft = "rust",
		init = function()
			vim.g.rustfmt_autosave = 1
		end,
	},
	"hrsh7th/nvim-cmp",
	"hrsh7th/cmp-nvim-lsp",
	"hrsh7th/cmp-nvim-lua",
	"hrsh7th/cmp-nvim-lsp-signature-help",
	"hrsh7th/cmp-vsnip",
	"hrsh7th/cmp-path",
	"hrsh7th/cmp-buffer",
	"hrsh7th/vim-vsnip",
	"echasnovski/mini.animate",
	{
		"glepnir/lspsaga.nvim",
		branch = "main",
		dependencies = {
			{ "nvim-tree/nvim-web-devicons" },
			-- { "nvim-treesitter/nvim-treesitter" },
			-- { "windwp/nvim-ts-autotag" },
		},
	}, -- enhanced lsp uis
	"jose-elias-alvarez/typescript.nvim", -- additional functionality for typescript server (e.g. rename file & update imports)
	"onsails/lspkind.nvim", -- vs-code like icons for autocompletion

	-- formatting & linting
	-- auto closing
	"windwp/nvim-autopairs", -- autoclose parens, brackets, quotes, etc...

	-- git integration
	"lewis6991/gitsigns.nvim", -- show line modifications on left hand side

	"nvim-lualine/lualine.nvim",
	require("rusty-guy.plugins.formatting"),
	{
		"ray-x/go.nvim",
		dependencies = { -- optional packages
			"ray-x/guihua.lua",
			"neovim/nvim-lspconfig",
		},
		config = function()
			require("go").setup()
		end,
		event = { "CmdlineEnter" },
		ft = { "go", "gomod" },
		build = ':lua require("go.install").update_all_sync()', -- if you need to install/update all binaries
	},
})
