-- Mapping the leader must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
-- vim.g.maplocalleader = ' '

-- Before everything else
require 'lazy-bootstrap'
require 'logo'
require 'lazy-plugins'

-- Thereafter
require 'options'
require 'telescope-setup'
require 'treesitter-setup'
require 'lsp-setup'
require 'cmp-setup'
require 'color-setup'
require 'harpoon-setup'
require 'nvim-r-setup'
require 'oil-setup'
require 'dap-js'
require 'duck-setup'
require 'mason-null-ls-setup'

-- After everything else
require 'remaps'
