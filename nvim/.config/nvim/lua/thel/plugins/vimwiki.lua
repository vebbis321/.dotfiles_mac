return {
	{
		"vimwiki/vimwiki",
		branch = "dev",
		init = function()
			print("Setting up vimwiki!")
			vim.g.vimwiki_list = {
				{
					template_path = vim.fn.stdpath("data") .. "/site/pack/packer/start/vimwiki/autoload/",
					syntax = "markdown",
					ext = ".md",
					path = "~/Documents/thelwiki", -- does not work?=!?!?
				},
			}

			vim.g.vimwiki_ext2syntax = {
				[".md"] = "markdown",
				[".markdown"] = "markdown",
				[".mdown"] = "markdown",
			}

			vim.g.vimwiki_global_ext = 0
		end,
	},
}
