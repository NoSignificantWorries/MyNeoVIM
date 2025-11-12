vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(event)
		local bufopts = { noremap = true, silent = true, buffer = event.bufnr }

		vim.keymap.set("n", "gk", vim.lsp.buf.hover, bufopts, { desc = "Lsp hover" })
		vim.keymap.set("n", "gK", vim.lsp.buf.signature_help, bufopts, { desc = "Signature help" })
		vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts, { desc = "Rename" })
		vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts, { desc = "Code actions" })

		vim.keymap.set("n", "<leader>gf", function()
			vim.lsp.buf.format({ async = true })
		end, bufopts, { desc = "Format code" })
	end,
})

vim.api.nvim_create_autocmd("FileType", {
	pattern = "snacks_dashboard",
	callback = function()
		vim.opt_local.foldenable = false
	end,
})
