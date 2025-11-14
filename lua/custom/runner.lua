local function is_safe_directory(path)
	local home_dir = os.getenv("HOME")

	if not home_dir then
		return false
	end

	local current_path = vim.fn.resolve(vim.fn.expand(path))

	local system_dirs = { "/", "/etc", "/var", "/usr", "/sys", "/proc", home_dir }
	for _, dir in ipairs(system_dirs) do
		if current_path == dir then
			return false
		end
	end

	return true
end

local function is_ipynb_file(filename)
	return vim.fn.fnamemodify(filename, ":e") == "ipynb"
end

local browser = "min-browser"

local notify_conf = {
	title = "Jupyter Notebook",
	timeout = 5000,
}

vim.api.nvim_create_user_command("JupyterStart", function()
	local current_dir = vim.fn.getcwd()

	if not is_safe_directory(current_dir) then
		vim.notify("󱧴 It`s not correct working directory", "error", notify_conf)
		return
	end

	vim.notify(" Starting notebook in " .. current_dir, "info", notify_conf)

	local cmd = "cd " .. vim.fn.shellescape(current_dir) .. " && jupyter notebook --no-browser > /dev/null 2>&1 &"
	os.execute(cmd)

	vim.notify(" Jupyter server succesfully started", "info", notify_conf)
end, { desc = "Starting new Jupyter Server" })

vim.api.nvim_create_user_command("JupyterServers", function()
	vim.notify("Current servers: ", "info", notify_conf)
end, { desc = "Show list of running Jupyter servers" })

vim.api.nvim_create_user_command("JupyterRunNotebook", function(opts)
	local filepath = opts.args

	if filepath == "" then
		filepath = vim.fn.expand("%:p")
	end

	if not is_ipynb_file(filepath) then
		vim.notify("It`s not a *.ipynb file", "error", notify_conf)
		return
	end
end, { nargs = 1, desc = "Run Jupyter Notebook" })

vim.api.nvim_create_user_command("JupyterStopAll", function()
	vim.notify(" Stopping Jupyter Servers...", "info", notify_conf)

	local cmd = "pkill -f jupyter-notebook"
	os.execute(cmd)

	vim.notify(" Succesfully stopped", "info", notify_conf)
end, { desc = "Stopping all Jupyter Servers" })
