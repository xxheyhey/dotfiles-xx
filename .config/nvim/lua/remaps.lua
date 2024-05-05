-- Keymaps
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
vim.keymap.set({ 'n', 'v' }, '<CR>', '<Nop>', { silent = true })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Open the Oil file explorer
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move line up" })

-- Paste and delete without changing paste buffer
vim.keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without changing paste buffer" })
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]], { desc = "Delete without changing paste buffer" })

-- yank to clipboard
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]], { desc = "Yank to clipboard" })
vim.keymap.set("n", "<leader>Y", [["+Y]], { desc = "Yank to clipboard" })

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { desc = "'chmod + x' on current file", silent = true })

-- tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>", { desc = "Launch tmux-sessionizer script" })
vim.keymap.set("n", "<C-g>", "<cmd>silent !open-current-dir<CR>", { desc = "Launch open-current-dir script" })

-- Format file
vim.keymap.set("n", "<leader>f", function() vim.lsp.buf.format({ async = true, }) end, { desc = "Format file" })

-- Quickfix list
vim.keymap.set("n", "<up>", "<cmd>cnext<CR>zz", { desc = "Quickfix list next" })
vim.keymap.set("n", "<down>", "<cmd>cprev<CR>zz", { desc = "Quickfix list previous" })
vim.keymap.set("n", "<leader><up>", "<cmd>lnext<CR>zz", { desc = "Idk" })
vim.keymap.set("n", "<leader><down>", "<cmd>lprev<CR>zz", { desc = "Idk" })

-- Switch to next window
vim.keymap.set("n", "<tab>", "<cmd>winc w<CR>", { desc = "Change focus to next vim window", silent = true })

-- Toggle wrap
vim.keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>", { desc = "Toggle wrap", silent = true })

-- Toggle the color scheme
vim.keymap.set('n', '<leader>th', '<cmd>lua ToggleColorScheme()<CR>', { desc = "Toggle theme", silent = true })

-- Toggle transparency (custom scripts)
vim.keymap.set("n", "<leader>tro", "<cmd>silent !transon<CR>", { desc = "Transparency on" })
vim.keymap.set("n", "<leader>trf", "<cmd>silent !transoff<CR>", { desc = "Transparency off" })

-- Toggle ZenMode
vim.keymap.set("n", "<F11>", "<cmd>ZenMode<CR>", { desc = "Start ZenMode", silent = true })

-- Open current file in browser
vim.keymap.set("n", "gX", "<cmd>silent !google-chrome-stable % &<CR>", { desc = "Open current file in Chrome" })
vim.keymap.set("n", "<leader>oc", "<cmd>silent !google-chrome-stable % &<CR>", { desc = "Open current file in Chrome" })
vim.keymap.set("n", "<leader>of", "<cmd>silent !firefox % &<CR>", { desc = "Open current file in Firefox" })

-- nvim-spectre
vim.keymap.set('n', '<leader>Sr', '<cmd>lua require("spectre").toggle()<CR>', { desc = "Toggle Spectre" })
vim.keymap.set('n', '<leader>Sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>',
    { desc = "Search current word" })
vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', { desc = "Search current word" })
vim.keymap.set('n', '<leader>Sf', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>',
    { desc = "Search on current file" })

-- Simpler search and replace than nvim-spectre:
-- Search and replace in regex mode, '\(' means match bracket and not open atom
vim.keymap.set("n", "<leader>sr", ":%s/\\v", { desc = "Search and replace" })
-- Search and replace current word
vim.keymap.set("n", "<leader>sw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
    { desc = "Change the current and all the same words" })

-- Neotree
vim.keymap.set('n', '<leader>T', '<cmd>Neotree reveal<CR>', { desc = "Neotree", silent = true })

-- Diffview
vim.keymap.set("n", "<leader>gd", "<cmd>DiffviewOpen<CR>", { desc = "DiffviewOpen", silent = true })
vim.keymap.set("n", "<leader>gq", "<cmd>DiffviewClose<CR>", { desc = "DiffviewClose", silent = true })

-- Search through all keymaps with Telescope
vim.keymap.set("n", "<leader>key", "<cmd>Telescope keymaps<CR>", { desc = "Search through keymaps", silent = true })

-- Neogit
vim.keymap.set("n", "<leader>gs", function() require('neogit').open({ kind = 'split' }) end, { desc = "Neogit" })
vim.keymap.set("n", "<leader>gc", function() require('neogit').open({ kind = 'split' }) end, { desc = "Neogit" })

-- Biscuits toggle
vim.keymap.set("n", "<leader>tb", function() require("nvim-biscuits").toggle_biscuits() end, { desc = "Toggle Biscuits" })

-- Comment
vim.keymap.set("n", "<leader>c", "<Nop>", { desc = "Insert comment" })

-- Undotree
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undotree" })

-- Other
vim.keymap.set("n", "J", "mzJ`z")

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")

-- Functions
vim.cmd [[command! -nargs=0 W :w]]
vim.cmd [[command! -nargs=0 WQ :wq]]
vim.cmd [[command! -nargs=0 Wq :wq]]
vim.cmd [[command! -nargs=0 Q :q]]
