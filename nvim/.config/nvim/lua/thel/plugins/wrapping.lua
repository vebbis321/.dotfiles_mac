return {
	{
		"andrewferrier/wrapping.nvim",
		config = function()
			require("wrapping").setup({
				softener = {
					markdown = function()
						-- Some custom logic
						return true
					end,
				},
			})
		end,
	},
}
