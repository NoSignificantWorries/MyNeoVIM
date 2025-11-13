local get_buf_info = function()
	return {
		type = vim.bo.filetype,
		name = vim.fn.expand("%:t"),
	}
end

local filetypes = {
	lua = {
		cmd = "lua",
	},
	python = {
		cmd = "python3 -m",
	},
}

vim.api.nvim_create_user_command("RunCode", function(opts)
	local bufinfo = get_buf_info()
	vim.notify(filetypes[bufinfo.type].cmd .. "\n" .. bufinfo.name, "info", { title = "Filetype", timeout = 3000 })
end, {})
