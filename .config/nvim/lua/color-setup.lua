-- theme customization

Mycolor = "tokyonight" -- Change this to switch themes

-- Rose-pine theme
require('rose-pine').setup {
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
}

-- Tokyonight theme
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

    -- Changing some colors
    ---@param colors ColorScheme
    on_colors = function(colors)
        --colors.green = "#b4f56e"
        colors.comment = "#7d86ad"
    end

})

-- Catpuccin
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
        telescope = { enabled = true, },
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
        }
    },
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

-- Lualine setup
require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = Mycolor,
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
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
            {
                "filename",
            },
        },
        lualine_x = { "filesize" },
        lualine_y = {
            {
                "filetype",
                -- color = {
                --     fg = "#1C1D21",
                --     bg = "#eba0ac",
                -- },
            },
        },
        lualine_z = {
            {
                "location",
                icon = "",
                -- color = {
                --     fg = "#1c1d21",
                --     bg = "#f2cdcd",
                -- },
            },
        },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
}
