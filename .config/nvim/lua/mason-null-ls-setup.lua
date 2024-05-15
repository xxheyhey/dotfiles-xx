local null_ls = require("null-ls")

require("mason-null-ls").setup({
    -- A list of sources to install if they're not already installed.
    -- This setting has no relation with the `automatic_installation` setting.
    ensure_installed = {},
    -- Run `require("null-ls").setup`.
    -- Will automatically install masons tools based on selected sources in `null-ls`.
    -- Can also be an exclusion list.
    -- Example: `automatic_installation = { exclude = { "rust_analyzer", "solargraph" } }`
    automatic_installation = false,
    -- Sources found installed in mason will automatically be set up for null-ls.
    automatic_setup = true,
    handlers = {
        -- Hint: see https://github.com/nvimtools/none-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
        --       to see what sources are available
        -- Hint: see https://github.com/jose-elias-alvarez/null-ls.nvim/blob/main/doc/BUILTIN_CONFIG.md
        --       to check what we can configure for each source
        ocamlformat = function(source_name, methods)
            null_ls.register(null_ls.builtins.formatting.ocamlformat.with({
                -- Add more arguments to a source's defaults
                -- Default: { "--enable-outside-detected-project", "--name", "$FILENAME", "-" }
                -- Type `ocamlformat --help` in your terminal to check more args
                extra_args = { "--if-then-else", "vertical", "--break-cases", "toplevel", "--extension-indent", "2", "--function-indent", "2", "--let-binding-indent", "2", "--type-decl-indent", "2", "--exp-grouping", "preserve" },
            }))
        end,
    },
})

null_ls.setup()
