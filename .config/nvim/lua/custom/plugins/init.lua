-- Plugins without extensive setup are added here
return {
	-- The most important dependency
	"nvim-lua/plenary.nvim",

	-- Other
	"ThePrimeagen/vim-be-good",
	"mbbill/undotree",

	-- Useful plugin to show you pending keybinds.
	{ "folke/which-key.nvim", opts = {} },
	{ "nvim-treesitter/nvim-treesitter-context", opts = { max_lines = 3 } },
	{ "folke/persistence.nvim", event = "BufReadPre", opts = {} },
	{ "folke/zen-mode.nvim", opts = { window = { width = 1.0 }, plugins = { tmux = { enabled = true } } } },
	{
		"nvim-pack/nvim-spectre",
		opts = {
			default = {
				find = {
					cmd = "rg",
					options = { "hidden" },
				},
			},
		},
	},
	{
		"NeogitOrg/neogit",
		branch = "nightly",
		dependencies = {
			"nvim-lua/plenary.nvim", -- required
			"sindrets/diffview.nvim", -- optional - Diff integration
			"nvim-telescope/telescope.nvim", -- optional
		},
		config = true,
	},
	{
		"folke/todo-comments.nvim",
		dependencies = { "nvim-lua/plenary.nvim" },
		opts = {
			keywords = {
				REMOVE = { icon = " ", color = "error", alt = { "REMOVE" } },
			},
		},
	},
	-- "gc" to comment visual regions/lines
	{
		"numToStr/Comment.nvim",
		opts = {
			extra = {
				-- Add comment at the end of line
				eol = "<leader>C",
			},
		},
		lazy = false,
	},
}
