-- [[ Setting options ]]
-- See `:help vim.opt`

-- Set highlight on search
vim.opt.hlsearch = false

-- Make line numbers default
vim.wo.number = true
vim.opt.nu = true

-- Relative line numbers
vim.opt.relativenumber = true

-- Enable mouse mode
vim.opt.mouse = 'a'

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Keep signcolumn on by default
vim.wo.signcolumn = 'yes'

-- Decrease update time
vim.opt.updatetime = 250
vim.opt.timeoutlen = 500

-- Set completeopt to have a better completion experience
vim.opt.completeopt = 'menuone,noselect'

vim.opt.termguicolors = true

-- Tab width
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Indentation
vim.opt.smartindent = true
vim.opt.autoindent = true

-- Disable line wrap
vim.opt.wrap = false

-- Enable break indent for wrap mode
vim.o.breakindent = true

-- Undo history settings
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

-- Formatting options
vim.cmd("autocmd BufEnter * set formatoptions-=cro")
vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- Taken from tjdevries's github, but NOTE: does not work
vim.opt.formatoptions = vim.opt.formatoptions
    - "a"                  -- Auto formatting is BAD.
    - "t"                  -- Don't auto format my code. I got linters for that.
    - "c"                  -- In general, I like it when comments respect textwidth
    - "o"                  -- O and o, don't continue comments
    - "r"                  -- But do continue when pressing enter.
    + "n"                  -- Indent past the formatlistpat, not underneath it.
    - "2"                  -- Idk what this does

vim.opt.joinspaces = false -- Same for this one...


-- Other settings
vim.opt.incsearch = true
vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")
vim.opt.colorcolumn = "80"
vim.diagnostic.config({
    virtual_text = true
})
vim.opt.shortmess:append({ I = true }) -- Remove intro screen because of flicker bug

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
    callback = function()
        vim.highlight.on_yank()
    end,
    group = highlight_group,
    pattern = '*',
})
