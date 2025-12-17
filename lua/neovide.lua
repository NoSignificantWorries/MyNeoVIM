M = {}

M.setup = function()
	if not vim.g.neovide then
		return
	end
	vim.g.neovide_scale_factor = 0.9
	-- vim.g.neovide_cursor_vfx_mode = "ripple"
	vim.o.guifont = "JetBrainsMono Nerd Font:h14"
	vim.g.neovide_floating_corner_radius = 0.25

	vim.g.neovide_background_color = "#1e1e2e"
	vim.api.nvim_set_hl(0, "Normal", { bg = "#1e1e2e" })
end

return M
