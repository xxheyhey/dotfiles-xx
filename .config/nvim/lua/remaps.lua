-- Keymaps
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Open the Oil file explorer
vim.keymap.set("n", "<leader>pv", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- And as a popup
vim.keymap.set("n", "-", "<cmd>lua require('oil').toggle_float()<CR>", { desc = "Oil" })

-- Move lines up and down
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Paste and delete without changing paste buffer
vim.keymap.set("x", "<leader>p", [["_dP]])
vim.keymap.set({"n", "v"}, "<leader>d", [["_d]])

-- yank to clipboard
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

-- Search and replace in regex mode, '\(' means match bracket and not open atom
vim.keymap.set("n", "<leader>sr", ":%s/\\v")

-- Change all words that are the same as the one you're on
vim.keymap.set("n", "<leader>sw", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Make file executable
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

-- Format file (remove white spaces and such)
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

-- Quickfix list
vim.keymap.set("n", "<up>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<down>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader><up>", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader><down>", "<cmd>lprev<CR>zz")

-- Switch to next window
vim.keymap.set("n", "<tab>", "<cmd>winc w<CR>", { silent = true })

-- Toggle wrap
vim.keymap.set("n", "<leader>tw", "<cmd>set wrap!<CR>", { silent = true })

-- Toggle the color scheme
vim.keymap.set('n', '<leader>th', '<cmd>lua ToggleColorScheme()<CR>', { silent = true })

-- Toggle transparency (custom scripts)
vim.keymap.set("n", "<leader>tro", "<cmd>!transon<CR>", { silent = true })
vim.keymap.set("n", "<leader>trf", "<cmd>!transoff<CR>", { silent = true })

-- Toggle ZenMode
vim.keymap.set("n", "<F11>", "<cmd>ZenMode<CR>", { silent = true })

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
