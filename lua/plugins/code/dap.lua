-- Добавьте в ваш конфиг (например, lua/plugins/debug.lua для LazyVim)
return {
	-- Основной DAP клиент
	{
		"mfussenegger/nvim-dap",
		keys = {
			-- Типичные горячие клавиши
			{
				"<F5>",
				function()
					require("dap").continue()
				end,
				desc = "Continue/Start",
			},
			{
				"<F10>",
				function()
					require("dap").step_over()
				end,
				desc = "Step Over",
			},
			{
				"<F11>",
				function()
					require("dap").step_into()
				end,
				desc = "Step Into",
			},
			{
				"<F12>",
				function()
					require("dap").step_out()
				end,
				desc = "Step Out",
			},
			{
				"<F9>",
				function()
					require("dap").toggle_breakpoint()
				end,
				desc = "Toggle Breakpoint",
			},
		},
		config = function()
			local dap = require("dap")

			-- Настройка debugpy адаптера
			dap.adapters.python = function(cb, config)
				if config.request == "attach" then
					-- Для attach режима
					cb({
						type = "server",
						host = config.host or "127.0.0.1",
						port = config.port or 5678,
					})
				else
					-- Для launch режима
					cb({
						type = "executable",
						command = "python",
						args = {
							"-m",
							"debugpy.adapter",
						},
					})
				end
			end

			-- Базовая конфигурация для Python
			dap.configurations.python = {
				{
					-- Обычный скрипт
					name = "Run current file",
					type = "python",
					request = "launch",
					program = "${file}",
					pythonPath = function()
						-- Определяем виртуальное окружение
						local venv = os.getenv("VIRTUAL_ENV")
						if venv then
							return venv .. "/bin/python"
						end
						return "/usr/bin/python3" -- или vim.fn.executable("python3")
					end,
					console = "integratedTerminal",
					justMyCode = false, -- Отлаживать и сторонний код
					stopOnEntry = false, -- Не останавливаться на первой строке
				},
			}
		end,
	},

	-- UI интерфейс для DAP (как в IDE)
	{
		"rcarriga/nvim-dap-ui",
		dependencies = { "mfussenegger/nvim-dap", "nvim-neotest/nvim-nio" },
		keys = {
			{
				"<leader>du",
				function()
					require("dapui").toggle()
				end,
				desc = "Toggle DAP UI",
			},
		},
	},

	-- Показывает значения переменных прямо в коде
	{
		"theHamsta/nvim-dap-virtual-text",
		config = true,
	},

	-- Интеграция с Telescope для поиска breakpoints и т.д.
	{
		"nvim-telescope/telescope-dap.nvim",
		dependencies = { "nvim-telescope/telescope.nvim" },
	},
}
