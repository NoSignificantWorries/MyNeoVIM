return {
	cmd = { "vtsls", "--stdio" },
	filetypes = {
		"typescript",
		"typescriptreact",
		"javascript",
		"javascriptreact",
	},
	root_markers = {
		"package.json",
		"tsconfig.json",
		"jsconfig.json",
		".git",
	},
	workspace_required = true,
	settings = {
		typescript = {
			preferences = {
				importModuleSpecifier = "relative",
			},
		},
	},
}
