-- [[ Configure LSP ]]
--  This function gets run when an LSP connects to a particular buffer.
local on_attach = function(_, bufnr)
    -- We create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.

    local lspmap = function(keys, func, desc)
        if desc then
            desc = 'LSP: ' .. desc
        end

        vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    lspmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    lspmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    lspmap('gd', require('telescope.builtin').lsp_definitions, '[G]oto [D]efinition')
    lspmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    lspmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    lspmap('<leader>D', require('telescope.builtin').lsp_type_definitions, 'Type [D]efinition')
    lspmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    lspmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    lspmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    lspmap('<C-s>', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    lspmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    lspmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    lspmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    lspmap('<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
        vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })
end

-- document existing key chains
require('which-key').register {
    ['<leader>wc'] = { name = '[C]ode', _ = 'which_key_ignore' },
    ['<leader>wd'] = { name = '[D]ocument', _ = 'which_key_ignore' },
    ['<leader>wg'] = { name = '[G]it', _ = 'which_key_ignore' },
    ['<leader>wh'] = { name = 'Git [H]unk', _ = 'which_key_ignore' },
    ['<leader>wr'] = { name = '[R]ename', _ = 'which_key_ignore' },
    ['<leader>ws'] = { name = '[S]earch', _ = 'which_key_ignore' },
    ['<leader>wt'] = { name = '[T]oggle', _ = 'which_key_ignore' },
    ['<leader>ww'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
}
-- register which-key VISUAL mode
-- required for visual <leader>hs (hunk stage) to work
require('which-key').register({
    ['<leader>'] = { name = 'VISUAL <leader>' },
    ['<leader>h'] = { 'Git [H]unk' },
}, { mode = 'v' })

-- mason-lspconfig requires that these setup functions are called in this order
-- before setting up the servers.
require('mason').setup()
require('mason-lspconfig').setup()

-- Enable the following language servers
--  Add any additional override configuration in the following tables. They will be passed to
--  the `settings` field of the server config. You must look up that documentation yourself.
--
--  If you want to override the default filetypes that your language server will attach to you can
--  define the property 'filetypes' to the map in question.
local servers = {
    clangd = {},
    gopls = {},
    pyright = {
        python = {
            analysis = {
                diagnosticSeverityOverrides = {
                    reportUnusedVariable = false, -- or anything
                },
            }
        }
    },
    rust_analyzer = {},
    tsserver = {},
    html = { filetypes = { 'html', 'twig', 'hbs' } },
    lua_ls = {
        Lua = {
            workspace = { checkThirdParty = false },
            telemetry = { enable = false },
            -- NOTE: toggle below to ignore Lua_LS's noisy `missing-fields` warnings
            diagnostics = { disable = { 'missing-fields' } },
        },
    },
    marksman = {},
    bashls = {},
    ocamllsp = {},
}

-- Setup neovim lua configuration
require('neodev').setup()

-- nvim-cmp supports additional completion capabilities, so broadcast that to servers
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

-- Ensure the servers above are installed
local mason_lspconfig = require 'mason-lspconfig'

mason_lspconfig.setup {
    ensure_installed = vim.tbl_keys(servers),
}

mason_lspconfig.setup_handlers {
    function(server_name)
        require('lspconfig')[server_name].setup {
            capabilities = capabilities,
            on_attach = on_attach,
            settings = servers[server_name],
            filetypes = (servers[server_name] or {}).filetypes,
        }
    end,
}
