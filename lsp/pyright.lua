---@type vim.lsp.Config
return {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_markers = { "pyproject.toml", "setup.py", ".git" },
	settings = {
		python = {
			analysis = {
				autoSearchPaths = true,
				useLibraryCodeForTypes = true,
				diagnosticMode = "workspace", -- Рекомендую для работы со всем проектом
				typeCheckingMode = "basic", -- "off", "basic", "strict"
			},
		},
	},
}
