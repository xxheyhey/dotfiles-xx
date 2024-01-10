vim.g.rout_follow_colorscheme = 1 -- R output colors
vim.g.Rout_more_colors = 1 -- More output colors
vim.g.R_auto_start = 2 -- Autostart R
vim.g.R_objbr_auto_start = 1 -- Autostart object window
vim.g.R_objbr_place = 'console,above' -- Location of the object window
vim.g.R_objbr_opendf = 1    -- Show data.frames elements
vim.g.R_objbr_openlist = 0  -- Show lists elements
vim.g.R_objbr_allnames = 0  -- Show hidden objects

-- ` or > won't result in R chunk in .Rmd and .Rnoweb files
vim.g.R_rmdchunk = '```' -- '```' inserts R chunk
vim.g.R_rnowebchunk = 0

vim.g.R_args =  { '--no-save', '--no-restore' } -- R Startup flags

-- Tried to change the R console size, to no avail
vim.g.rconsole_width = 57
vim.g.R_min_editor_width = 18
-- Resize R console after starting R (lol)
vim.g.R_after_start = { ':vert res +13' }

-- Knitting options
vim.g.R_openpdf = 2
vim.g.R_pdfviewer = 'evince'
vim.g.R_openhtml = 1

-- Functions that can autocomplete column names of data frames as *first argument*
vim.g.R_fun_data_1 = { 't.test' }

-- Open data frames and such in Visidata in another terminal
vim.g.R_csv_app = 'terminal:vd'
vim.g.R_tsv_app = 'terminal:vd'

-- Keymaps
vim.keymap.set('v', '<C-\\>', ':call SendSelectionToR("echo", "stay")<CR>', { silent = true }) -- Run selected line
vim.keymap.set('n', '<C-\\>', ':call SendLineToR("down")<CR>', { silent = true }) -- Run selected line
vim.keymap.set('n', '<leader>R', ':RSend ')

-- Disable automatic replacement of '_' by '<-'
vim.g.R_assign = 0
