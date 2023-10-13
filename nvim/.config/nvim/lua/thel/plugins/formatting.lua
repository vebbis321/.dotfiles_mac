return {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
	config = function()
		local conform = require("conform")

		conform.setup({
			formatters_by_ft = {
				swift = { "swiftformat", "swift_format" },
				c = { "clang-format" },
				python = { "isort", "black" },
				json = { "prettier" },
				markdown = { "prettier" },
				lua = { "stylua" },

				html = { "prettier" },
			},
			format_on_save = {
				lsp_fallback = true,
				async = false,
				timeouts_ms = 500,
			},
		})

		vim.keymap.set({ "n", "v" }, "<leader>mp", function()
			conform.format({
				lsp_fallback = true,
				async = false,
				timeouts_ms = 500,
			})
		end, { desc = "Format file or range (in visual mode)" })
	end,
}
