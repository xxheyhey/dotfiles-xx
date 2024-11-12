return {
	{
		"jamespeapen/Nvim-R",
		config = function()
			vim.g.rout_follow_colorscheme = 1 -- R output colors
			vim.g.Rout_more_colors = 1 -- More output colors
			vim.g.R_auto_start = 2 -- Autostart R
			vim.g.R_objbr_auto_start = 1 -- Autostart object window
			vim.g.R_objbr_place = "console,above" -- Location of the object window
			vim.g.R_objbr_opendf = 1 -- Show data.frames elements
			vim.g.R_objbr_openlist = 0 -- Show lists elements
            -- vim.g.R_objbr_allnames = 0  -- Show hidden objects
			-- ` or > won't result in R chunk in .Rmd and .Rnoweb files
			vim.g.R_rmdchunk = "```" -- '```' inserts R chunk in insert mode
			vim.g.R_rnowebchunk = 0

			vim.g.R_args = { "--no-save", "--no-restore" } -- R Startup flags

			-- Resize R console and object browser after starting R
			vim.g.R_after_start = { ":vert res +2" }

			-- Knitting options
			vim.g.R_openpdf = 2
			vim.g.R_pdfviewer = "evince"
			vim.g.R_openhtml = 1

			-- Functions that can autocomplete column names of data frames as *first argument*
			vim.g.R_fun_data_1 = { "t.test", "lm", "gls", "glm" }

			-- Open data frames and such in Visidata in another terminal
			vim.g.R_csv_app = "terminal:vd"
			vim.g.R_tsv_app = "terminal:vd"

			-- Disable automatic replacement of '_' by '<-'
			vim.g.R_assign = 0

			-- Enable the ability to add '#' to the beginning of lines
			vim.g.R_enable_comment = 1
			vim.g.R_rcomment_string = "#"

			-- All the settings that will just be applied to a local buffer when opening a
			-- .R or .Rmd file
			vim.api.nvim_create_autocmd("FileType", {
				pattern = { "r", "rmd" },
				callback = function()
					-- Keymaps
					local set = vim.keymap.set
					set("v", "✗", ':call SendSelectionToR("echo", "stay")<CR>', { silent = true }) -- Run selected line
					set("n", "✗", ':call SendLineToR("down")<CR>', { silent = true }) -- Run selected line
					set("n", "✓", ':call b:SendChunkToR("echo", "down")<CR>', { silent = true }) -- Run selected R chunk
					set("n", "<leader>R", ":RSend ")
					set("n", "<LocalLeader>q", ":RStop<CR>")
					set("n", "gcr", ':call RSimpleCommentLine("selection", "c")<CR>', { silent = true })
					set("v", "gcr", ':call RSimpleCommentLine("normal", "c")<CR>', { silent = true })
					set("n", "<C-l>", ":call RClearConsole()<CR>", { silent = true })
					set("n", "<C-q>", ':call RQuit("nosave")<CR>', { silent = true })
					set("n", "<C-s>", ':call StartR("R")<CR>', { silent = true })
					set("n", "<leader>gn", ":call b:NextRChunk()<CR>", { silent = true })
					set("n", "<leader>gp", ":call b:PreviousRChunk()<CR>", { silent = true })
					set("n", "mm", ':call RMakeRmd("default")<CR>', { silent = true })
					set("n", "mp", ':call RMakeRmd("pdf_document")<CR>', { silent = true })
					set("n", "mh", ':call RMakeRmd("html_document")<CR>', { silent = true })
					set("n", "mw", ':call RMakeRmd("word_document")<CR>', { silent = true })
					set("n", "<leader>o", ":call SendLineToRAndInsertOutput()<CR>", { silent = true })
				end,
			})
		end,
	},
}
