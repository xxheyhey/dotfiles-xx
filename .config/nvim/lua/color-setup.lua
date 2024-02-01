-- theme customization

Mycolor = "rose-pine" -- Just change this to switch themes

-- Rose-pine theme
require('rose-pine').setup {
    dark_variant = "moon", -- main, moon, or dawn
    dim_inactive_windows = true,
    styles = {
        -- transparency = true,
        italic = false,
    },
	highlight_groups = {
        -- Telescope colors
		TelescopeBorder = { fg = "highlight_high", bg = "none" },
		TelescopeNormal = { bg = "none" },
		TelescopePromptNormal = { bg = "base" },
		TelescopeResultsNormal = { fg = "subtle", bg = "none" },
        -- Normal background color
        Normal = { bg = "#1f1d2e" }, -- Rosé pine normal "surface"
        NormalFloat = { bg = "#1f1d2e" }, -- Rosé pine normal "surface"
        -- Normal = { bg = "#191724" }, -- Rosé pine normal "base"
        -- NormalFloat = { bg = "#191724" }, -- Rosé pine normal "base"
	},
}

-- Tokyonight theme
require("tokyonight").setup({
    style = "night", -- The theme comes in four styles, `storm`, `moon`, a darker variant `night` and `day`
    -- transparent = true, -- Enable this to disable setting the background color
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = { italic = false },
        keywords = { italic = false },
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
    },
    lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold

    -- Changing some colors
    ---@param colors ColorScheme
    on_colors = function(colors)
        --colors.green = "#b4f56e"
        colors.comment = "#7d86ad"
    end

})

-- This function sets the theme the right way
function Color(color)
    color = color or Mycolor
    vim.cmd.colorscheme(color)

    -- The following is needed for some themes to fix the background
    -- of some windows or parts of the screen
    -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end
Color() -- Run function at startup

-- Function to toggle between themes
function ToggleColorScheme()
    if Mycolor == "tokyonight" then
        Mycolor = "rose-pine"
    else
        Mycolor = "tokyonight"
    end
    Color()
end

-- Lualine setup
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = Mycolor,
        component_separators = '|',
        section_separators = '',
    },
}
