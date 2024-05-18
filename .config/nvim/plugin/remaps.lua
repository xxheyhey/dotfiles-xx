-- See `:help set()`
local set = vim.keymap.set

set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
set({ 'n', 'v' }, '<CR>', '<Nop>', { silent = true })

set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Open the Oil file explorer
set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Move lines up and down
set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Paste and delete without changing paste buffer
set("x", "<leader>p", [["_dP]], { desc = "Paste without changing paste buffer" })
set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without changing paste buffer" })

-- yank to clipboard
set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
set("n", "<leader>Y", [["+Y]], { desc = "Yank to clipboard" })

-- Make file executable
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "'chmod + x' on current file", silent = true })

-- tmux-sessionizer
set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Launch tmux-sessionizer script" })
set("n", "<C-g>", "<cmd>silent !open-current-dir<CR>", { desc = "Launch open-current-dir script" })
set("n", "<leader>gh", "<cmd>silent !open-home-dir<CR>", { desc = "Launch open-current-dir script" })

-- Format file
set("n", "<leader>f", function() require("conform").format { lsp_fallback = true, quiet = true, } end,
    { desc = "Format file" })

-- Quickfix list
set("n", "<up>", "<cmd>cnext<CR>zz", { desc = "Quickfix list next" })
set("n", "<down>", "<cmd>cprev<CR>zz", { desc = "Quickfix list previous" })
set("n", "<leader><up>", "<cmd>lnext<CR>zz", { desc = "Idk" })
set("n", "<leader><down>", "<cmd>lprev<CR>zz", { desc = "Idk" })

-- Switch to next window
set("n", "<tab>", "<cmd>winc w<CR>", { desc = "Change focus to next vim window", silent = true })

-- Toggle wrap
set("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle wrap", silent = true })

-- Toggle the color scheme
set('n', '<leader>th', '<cmd>lua ToggleColorScheme()<CR>', { desc = "Toggle theme", silent = true })

-- Toggle transparency (custom scripts)
set("n", "<leader>tro", "<cmd>silent !transon<CR>", { desc = "Transparency on" })
set("n", "<leader>trf", "<cmd>silent !transoff<CR>", { desc = "Transparency off" })

-- Toggle ZenMode
set("n", "<F11>", "<cmd>ZenMode<CR>", { desc = "Start ZenMode", silent = true })

-- Open current file in browser
set("n", "gX", "<cmd>silent !google-chrome-stable % &<CR>", { desc = "Open current file in Chrome" })
set("n", "<leader>oc", "<cmd>silent !google-chrome-stable % &<CR>", { desc = "Open current file in Chrome" })
set("n", "<leader>of", "<cmd>silent !firefox % &<CR>", { desc = "Open current file in Firefox" })

-- nvim-spectre
set('n', '<leader>Sr', '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
set('n', '<leader>Sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
    { desc = "Search current word" })
set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search current word" })
set('n', '<leader>Sf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
    { desc = "Search on current file" })

-- Simpler search and replace than nvim-spectre:
-- Search and replace in regex mode, '\(' means match bracket and not open atom
set("n", "<leader>sr", ":%s/\\v", { desc = "Search and replace" })
-- Search and replace current word
set("n", "<leader>sw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Change the current and all the same words" })

-- Neotree
set('n', '<leader>T', '<cmd>Neotree reveal<CR>', { desc = "Neotree", silent = true })

-- Diffview
set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "DiffviewOpen", silent = true })
set("n", "<leader>gq", "<cmd>DiffviewClose<CR>", { desc = "DiffviewClose", silent = true })

-- Search through all keymaps with Telescope
set("n", "<leader>key", "<cmd>Telescope keymaps<CR>", { desc = "Search through keymaps", silent = true })

-- Neogit
set("n", "<leader>gs", function() require('neogit').open({ kind = 'split' }) end, { desc = "Neogit" })
set("n", "<leader>gc", function() require('neogit').open({ kind = 'split' }) end, { desc = "Neogit" })

-- Biscuits toggle
set("n", "<leader>tb", function() require("nvim-biscuits").toggle_biscuits() end, { desc = "Toggle Biscuits" })

-- Comment
set("n", "<leader>c", "<Nop>", { desc = "Insert comment" })

-- Undotree
set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undotree" })

-- Other
set("n", "J", "mzJ`z")

-- There are builtin keymaps for this now, but I (tjdevries) like that it shows
-- the float when I navigate to the error - so I override them.
set("n", "]d", vim.diagnostic.goto_next)
set("n", "[d", vim.diagnostic.goto_prev)


set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzzzv")
set("n", "N", "Nzzzv")
set("i", "<C-c>", "<Esc>")
set("n", "Q", "<nop>")

-- Functions
vim.cmd [[command! -nargs=0 W :w]]
vim.cmd [[command! -nargs=0 WQ :wq]]
vim.cmd [[command! -nargs=0 Wq :wq]]
vim.cmd [[command! -nargs=0 Q :q]]
