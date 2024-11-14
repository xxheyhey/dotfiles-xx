return {
	"R-nvim/R.nvim",
	-- Only required if you also set defaults.lazy = true
	lazy = false,
	-- R.nvim is still young and we may make some breaking changes from time
	-- to time. For now we recommend pinning to the latest minor version
	-- like so:
	version = "~0.1.0",
	config = function()
		require("r").setup({
			hook = {
				on_filetype = function()
					vim.api.nvim_buf_set_keymap(0, "n", "✗", "<Plug>RDSendLine", {})
					vim.api.nvim_buf_set_keymap(0, "v", "✗", "<Plug>RSendSelection", {})
					vim.api.nvim_buf_set_keymap(
						0,
						"n",
						"<LocalLeader>h",
						"<Cmd>lua require('r.run').action('levels')<CR>",
						{}
					)
				end,
			},
			R_args = { "--quiet", "--no-save" },
			min_editor_width = 10,
			rconsole_width = 60,
			auto_start = "always",
			objbr_auto_start = true,
			objbr_place = "console,below",
			objbr_opendf = true,
			objbr_openlist = false,
			config_tmux = false,
			pdfviewer = "evince",
			setwd = "nvim", -- working directory becomes the current nvim working directory
			csv_app = "terminal:vd",
			assignment_keymap = "",
			rmdchunk = "```", -- '```' inserts R chunk in insert mode
			rnowebchunk = false,
		})
	end,
}
