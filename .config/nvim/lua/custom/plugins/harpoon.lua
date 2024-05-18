return {
	{
		"ThePrimeagen/harpoon",
		lazy = false,
		branch = "harpoon2",
		dependencies = { "nvim-lua/plenary.nvim" },
		config = function()
			local harpoon = require("harpoon")

			-- REQUIRED
			harpoon:setup({
				settings = {
					save_on_toggle = true,
					sync_on_ui_close = true,
				},
			})
			-- REQUIRED
			vim.keymap.set("n", "<leader>a", function()
				harpoon:list():add()
			end, { desc = "Add to Harpoon list" })
			vim.keymap.set("n", "<C-e>", function()
				harpoon.ui:toggle_quick_menu(harpoon:list())
			end, { desc = "Open Harpoon list" })

			vim.keymap.set("n", "<C-b>", function()
				harpoon:list():select(1)
			end)
			vim.keymap.set("n", "<C-n>", function()
				harpoon:list():select(2)
			end)
			vim.keymap.set("n", "<C-m>", function()
				harpoon:list():select(3)
			end)

			for _, idx in ipairs({ 1, 2, 3, 4, 5, 6, 7, 8, 9 }) do
				vim.keymap.set("n", string.format("<leader>%d", idx), function()
					harpoon:list():select(idx)
				end)
			end

			vim.keymap.set("n", "<leader>0", function()
				harpoon:list():select(10)
			end)
		end,
	},
}
