vim.opt_local.shiftwidth = 2

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ lsp_fallback = true, quiet = true })
	local _, _ = pcall(function()
		vim.cmd([[:silent! %s/\\\[\(.*\)\\\]/[\1]/g]])
	end)
	vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<C-o>", true, true, true), "n", true)
end, { desc = "Format file" })
