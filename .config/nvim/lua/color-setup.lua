-- theme customization

function Color(color)
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

-- Onedark
-- require('onedark').setup {
--   transparent = true,
--   code_style = { comments = 'none' },
--   lualine = { transparent = true },
--   diagnostics = { background = false },
-- }

-- Rose-pine
-- require('rose-pine').setup {
--     styles = {
--         transparency = true,
--         italic = false,
--     },
-- }

require("tokyonight").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
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
    on_colors = function(colors)
        --colors.green = "#b4f56e"
        colors.comment = "#7d86ad"
    end

})

Color()

