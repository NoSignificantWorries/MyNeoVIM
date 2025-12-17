return {
	"barrett-ruth/live-server.nvim",
	event = "VeryLazy",
	build = "pnpm add -g live-server",
	cmd = { "LiveServerStart", "LiveServerStop" },
	config = true,
}
