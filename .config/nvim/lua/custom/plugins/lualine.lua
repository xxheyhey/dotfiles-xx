-- local custom_gruvbox = require("lualine.themes.gruvbox_dark")
--
-- -- Change the background of lualine_c section for normal mode
-- custom_gruvbox.normal.c.bg = "#112233"
local colors = {
	black = "#282828",
	white = "#ebdbb2",
	red = "#fb4934",
	green = "#b8bb26",
	blue = "#83a598",
	yellow = "#fe8019",
	gray = "#a89984",
	darkgray = "#3c3836",
	lightgray = "#504945",
	inactivegray = "#7c6f64",
}
local custom_gruvbox = {
	normal = {
		a = { bg = colors.gray, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.black, fg = colors.gray },
	},
	insert = {
		a = { bg = colors.blue, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.lightgray, fg = colors.white },
	},
	visual = {
		a = { bg = colors.yellow, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.inactivegray, fg = colors.black },
	},
	replace = {
		a = { bg = colors.red, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.black, fg = colors.white },
	},
	command = {
		a = { bg = colors.green, fg = colors.black, gui = "bold" },
		b = { bg = colors.lightgray, fg = colors.white },
		c = { bg = colors.inactivegray, fg = colors.black },
	},
	inactive = {
		a = { bg = colors.darkgray, fg = colors.gray, gui = "bold" },
		b = { bg = colors.darkgray, fg = colors.gray },
		c = { bg = colors.darkgray, fg = colors.gray },
	},
}
return {
	{
		-- Set lualine as statusline
		"nvim-lualine/lualine.nvim",
		-- See `:help lualine.txt`
		dependencies = { "nvim-tree/nvim-web-devicons" },
		config = function()
			require("lualine").setup({
				options = {
					theme = "auto",
					component_separators = { left = "", right = "" },
					section_separators = { left = "", right = "" },
				},
				sections = {
					lualine_a = {
						{
							"mode",
							icon = "",
							separator = { left = "", right = "" },
						},
					},
					lualine_b = {
						{
							"branch",
							icon = "",
							separator = { left = "", right = "" },
							color = {
								fg = "#1c1d21",
								bg = "#7d83ac",
							},
						},
						{
							"diff",
							separator = { left = "", right = "" },
							color = {
								fg = "#1c1d21",
								bg = "#7d83ac",
							},
						},
					},
					lualine_c = {
						{
							"diagnostics",
							separator = { left = "", right = "" },
							color = {
								bg = "#45475a",
							},
						},
						{ "filename" },
					},
					lualine_x = { "progress", "filesize" },
					lualine_y = { { "filetype" } },
					lualine_z = { { "location", icon = "" } },
				},
			})
		end,
	},
}
