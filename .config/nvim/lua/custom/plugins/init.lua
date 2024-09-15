-- Plugins without extensive setup are added here
return {
	-- The most important dependency
	"nvim-lua/plenary.nvim",

	-- Other
	"ThePrimeagen/vim-be-good",
	"mbbill/undotree",

	-- Useful plugin to show you pending keybinds.
	{ "nvim-treesitter/nvim-treesitter-context", opts = { max_lines = 3 } },
	{ "folke/persistence.nvim", event = "BufReadPre", opts = {} },
	{ "folke/zen-mode.nvim", opts = { window = { width = 1.0 }, plugins = { tmux = { enabled = true } } } },
	{
		"folke/which-key.nvim",
		event = "VeryLazy",
		opts = {
			-- your configuration comes here
			-- or leave it empty to use the default settings
			-- refer to the configuration section below
		},
		keys = {
			{
				"<leader>?",
				function()
					require("which-key").show({ global = false })
				end,
				desc = "Buffer Local Keymaps (which-key)",
			},
		},
	},
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
	{ "echasnovski/mini.icons", version = false, opts = {} },
}
