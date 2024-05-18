-- theme customization
Mycolor = "tokyonight" -- Change this to switch themes

-- This function sets the theme the right way
function Color(color)
	color = color or Mycolor
	vim.cmd.colorscheme(color)

	-- Highlight groups
	vim.api.nvim_set_hl(0, "BiscuitColor", { fg = "#494c57" })
	-- The following is needed for some themes to fix the background
	-- of some windows or parts of the screen
	-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- Function to cycle between themes
function ToggleColorScheme()
	if Mycolor == "catppuccin" then
		Mycolor = "rose-pine"
	elseif Mycolor == "rose-pine" then
		Mycolor = "tokyonight"
	else
		Mycolor = "catppuccin"
	end
	Color()
end

return {
	{
		-- Nice theme
		"rose-pine/neovim",
		name = "rose-pine",
		priority = 1000,
		config = function()
			require("rose-pine").setup({
				dark_variant = "moon", -- main, moon, or dawn
				dim_inactive_windows = false,
				styles = {
					transparency = true,
					italic = false,
				},
				-- highlight_groups = {
				--      -- Normal background color
				--      Normal = { bg = "#1f1d2e" }, -- Rosé pine normal "surface"
				--      NormalFloat = { bg = "#1f1d2e" }, -- Rosé pine normal "surface"
				--      -- Normal = { bg = "#191724" }, -- Rosé pine normal "base"
				--      -- NormalFloat = { bg = "#191724" }, -- Rosé pine normal "base"
				-- },
			})
		end,
	},
	{
		-- Another one
		"folke/tokyonight.nvim",
		lazy = false,
		priority = 1000,
		opts = {},
		config = function()
			require("tokyonight").setup({
				style = "night", -- The theme comes in four styles, `storm`, `moon`, a darker variant `night` and `day`
				transparent = true, -- Enable this to disable setting the background color
				styles = {
					-- Style to be applied to different syntax groups
					-- Value is any valid attr-list value for `:help nvim_set_hl`
					comments = { italic = false },
					keywords = { italic = false },
					sidebars = "transparent", -- style for sidebars, see below
					floats = "transparent", -- style for floating windows
				},
				lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

				-- Custom colors
				---@param colors ColorScheme
				on_colors = function(colors)
					--colors.green = "#b4f56e"
					colors.comment = "#7d86ad"
				end,
			})
		end,
	},
	{
		-- Another one
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		config = function()
			require("catppuccin").setup({
				transparent_background = true, -- disables setting the background color.
				no_italic = true,
				no_bold = true,
				integrations = {
					harpoon = true,
					fidget = true,
					cmp = true,
					gitsigns = true,
					treesitter = true,
					indent_blankline = { enabled = true },
					lsp_trouble = true,
					mason = true,
					native_lsp = {
						enabled = true,
						underlines = {
							errors = { "undercurl" },
							hints = { "undercurl" },
							warnings = { "undercurl" },
							information = { "undercurl" },
						},
					},
					telescope = { enabled = true },
					which_key = true,
					semantic_tokens = true,
					notify = true,
					treesitter_context = true,
					gitgutter = true,
					-- For more plugins integrations see https://github.com/catppuccin/nvim#integrations
				},
				color_overrides = {
					mocha = {
						-- These colours are pastel enough by default
						peach = "#fcc6a7",
						green = "#d2fac5",
					},
				},
			})
		end,
	},
}
