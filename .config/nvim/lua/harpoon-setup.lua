local harpoon = require("harpoon")

-- REQUIRED
harpoon:setup({
    settings = {
        save_on_toggle = true,
        sync_on_ui_close = true,
    },
})
-- REQUIRED

vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end, { desc = "Add to Harpoon list" })
vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end, { desc = "Open Harpoon list" })

vim.keymap.set("n", "<C-b>", function() harpoon:list():select(1) end)
vim.keymap.set("n", "<C-n>", function() harpoon:list():select(2) end)
vim.keymap.set("n", "<C-m>", function() harpoon:list():select(3) end)

vim.keymap.set("n", "<leader>1", function() harpoon:list():select(1) end, { desc = "Open Harpoon window 1" })
vim.keymap.set("n", "<leader>2", function() harpoon:list():select(2) end, { desc = "Open Harpoon window 2" })
vim.keymap.set("n", "<leader>3", function() harpoon:list():select(3) end, { desc = "Open Harpoon window 3" })
vim.keymap.set("n", "<leader>4", function() harpoon:list():select(4) end, { desc = "Open Harpoon window 4" })
vim.keymap.set("n", "<leader>5", function() harpoon:list():select(5) end, { desc = "Open Harpoon window 5" })
vim.keymap.set("n", "<leader>6", function() harpoon:list():select(6) end, { desc = "Open Harpoon window 6" })
vim.keymap.set("n", "<leader>7", function() harpoon:list():select(7) end, { desc = "Open Harpoon window 7" })
vim.keymap.set("n", "<leader>8", function() harpoon:list():select(8) end, { desc = "Open Harpoon window 8" })
vim.keymap.set("n", "<leader>9", function() harpoon:list():select(9) end, { desc = "Open Harpoon window 9" })
vim.keymap.set("n", "<leader>0", function() harpoon:list():select(10) end, { desc = "Open Harpoon window 10" })
