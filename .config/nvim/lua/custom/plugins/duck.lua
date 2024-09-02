return {
	{
		"tamton-aquib/duck.nvim",
		opts = {},
		config = function()
			local animals = { "🦆", "🐧", "🐆", "🐫", "🦩", "🐓", "🐈", "🦀", "🐀" }
			vim.keymap.set("n", "<leader>;;", function()
				require("duck").hatch(animals[math.random(#animals)], math.random(2, 5))
			end, { desc = "Hatch animal"})
            vim.keymap.set('n', '<leader>;k', function() require("duck").cook_all() end, {})
		end,
	},
}
