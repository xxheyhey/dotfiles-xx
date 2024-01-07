-- theme customization
-- require('onedark').setup {
--   transparent = true,
--   code_style = { comments = 'none' },
--   lualine = { transparent = true },
--   diagnostics = { background = false },
-- }

require('rose-pine').setup {
    disable_background = true,
    disable_float_background = true,
    disable_italics = true
}

require("tokyonight").setup({
    -- your configuration comes here
    -- or leave it empty to use the default settings
    style = "night", -- The theme comes in three styles, `storm`, `moon`, a darker variant `night` and `day`
    transparent = true, -- Enable this to disable setting the background color
    styles = {
        -- Style to be applied to different syntax groups
        -- Value is any valid attr-list value for `:help nvim_set_hl`
        comments = {},
        keywords = {},
        sidebars = "transparent", -- style for sidebars, see below
        floats = "transparent", -- style for floating windows
    },
    lualine_bold = true, -- When `true`, section headers in the lualine theme will be bold
    -- on_highlight = function(higlights, colors)
    --     -- NOG STRINGS VAN KLEUR VERANDEREN
    -- end
})

function Color(color)
    color = color or "tokyonight"
    vim.cmd.colorscheme(color)

    vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
    vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Color()
