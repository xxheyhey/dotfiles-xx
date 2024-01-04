-- theme customization
require('onedark').setup {
  transparent = true,
  code_style = { comments = 'none' },
  lualine = { transparent = true },
  diagnostics = { background = false },
}

function Color(color)
	color = color or "onedark"
	vim.cmd.colorscheme(color)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
end

Color()

-- vim: ts=2 sts=2 sw=2 et
