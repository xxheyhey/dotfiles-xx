vim.opt_local.shiftwidth = 2

vim.keymap.set("n", "<leader>f", function()
	require("conform").format({ lsp_fallback = true, quiet = true })
	local _, _ = pcall(function()
        vim.cmd([[:silent! %s/\\\[\(.*\)\\\]/[\1]/g]])
    end)
end, { desc = "Format file" })
