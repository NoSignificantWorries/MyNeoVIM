local M = {}

M.setup = function()
	vim.keymap.set({ "i", "v" }, "jk", "<ESC>", {})
	vim.keymap.set({ "i", "v" }, "kj", "<ESC>", {})
end

return M
