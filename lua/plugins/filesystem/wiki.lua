return {
	"lervag/wiki.vim",
	event = "VeryLazy",
	init = function()
		vim.g.wiki_root = os.getenv("HOME") .. "/wiki"
		vim.g.wiki_autowrite = 1
	end,
}
