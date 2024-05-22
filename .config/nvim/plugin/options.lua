-- See `:help vim.opt`

local opt = vim.opt

opt.inccommand = "split"

-- Set highlight off on search
opt.hlsearch = false

-- Make relative line numbers default
opt.number = true
opt.relativenumber = true

-- Enable mouse mode
opt.mouse = "a"

-- Case-insensitive searching UNLESS \C or capital in search
opt.ignorecase = true
opt.smartcase = true

-- Keep signcolumn on by default
opt.signcolumn = "yes"

-- Decrease update time
opt.updatetime = 250
opt.timeoutlen = 500

-- Tab width
opt.tabstop = 4
opt.softtabstop = 4
opt.shiftwidth = 4
opt.expandtab = true

-- Indentation
opt.smartindent = true
opt.autoindent = true

-- Disable line wrap
opt.wrap = false

-- Enable break indent for wrap mode
opt.breakindent = true

-- Undo history settings
opt.undofile = true
opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.nvim/undodir"

-- Formatting options
opt.formatoptions:remove("o")

-- Other settings
opt.termguicolors = true
opt.incsearch = true
opt.scrolloff = 8
opt.signcolumn = "yes"
opt.isfname:append("@-@")
opt.colorcolumn = "80"
vim.diagnostic.config({ virtual_text = true })

-- Highlight on yank
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
	callback = function()
		vim.highlight.on_yank()
	end,
	group = highlight_group,
	pattern = "*",
})
