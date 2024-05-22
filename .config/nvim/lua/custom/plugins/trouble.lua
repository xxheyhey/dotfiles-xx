return {
	{
		"folke/trouble.nvim",
		dependencies = { "nvim-tree/nvim-web-devicons" },
		opts = {},
		config = function()
			local trouble = require("trouble")

			vim.keymap.set("n", "<leader>tt", trouble.toggle, { desc = "Toggle Trouble" })
			vim.keymap.set("n", "[t", function()
				trouble.previous({ skip_goups = true, jump = true })
			end, { desc = "Trouble Previous" })
			vim.keymap.set("n", "]t", function()
				trouble.next({ skip_goups = true, jump = true })
			end, { desc = "Trouble Next" })
		end,
	},
}
