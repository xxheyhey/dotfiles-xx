return {
	{
		"christoomey/vim-tmux-navigator",
		cmd = {
			"TmuxNavigateLeft",
			"TmuxNavigateDown",
			"TmuxNavigateUp",
			"TmuxNavigateRight",
			"TmuxNavigatePrevious",
		},
		keys = {
			{ "<F1>", "<cmd>TmuxNavigateLeft<cr>" },
			{ "<F2>", "<cmd>TmuxNavigateDown<cr>" },
			{ "<F3>", "<cmd>TmuxNavigateUp<cr>" },
			{ "<F4>", "<cmd>TmuxNavigateRight<cr>" },
		},
	},
}
