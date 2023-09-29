return {
	"xbase-lab/xbase",
	run = "make install", -- or "make install && make free_space" (not recommended, longer build time)
	requires = {
		"neovim/nvim-lspconfig",
		"nvim-telescope/telescope.nvim", -- optional
		"nvim-lua/plenary.nvim", -- optional/requirement of telescope.nvim
		-- "stevearc/dressing.nvim", -- optional (in case you don't use telescope but something else)
	},
	config = function()
		require("lspconfig").sourcekit.setup({})
		require("xbase").setup({
			log_level = vim.log.levels.DEBUG,
			simctl = {
				iOS = {
					"iPhone 14 Pro",
					"iPhone 14",
				},
			},
		})
	end,
}
