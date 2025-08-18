return {
	{
		"mfussenegger/nvim-dap",
		event = "VeryLazy",
		config = function()
			local dap = require("dap")

			local dap_ui_status_ok, dapui = pcall(require, "dapui")
			if not dap_ui_status_ok then
				return
			end

			dap.listeners.after.event_initialized["dapui_config"] = function()
				dapui.open()
			end

			dap.listeners.before.event_terminated["dapui_config"] = function()
				dapui.close()
			end

			dap.listeners.before.event_exited["dapui_config"] = function()
				dapui.close()
			end

			dap.adapters.codelldb = {
				type = "server",
				port = "${port}",
				executable = {
					-- provide the absolute path for `codelldb` command if not using the one installed using `mason.nvim`
					command = "codelldb",
					args = { "--port", "${port}" },
					-- On windows you may have to uncomment this:
					-- detached = false,
				},
			}
			dap.configurations.c = {
				{
					name = "Launch file",
					type = "codelldb",
					request = "launch",
					program = function()
						local path
						vim.ui.input(
							{ prompt = "Path to executable: ", default = vim.loop.cwd() .. "/build/" },
							function(input)
								path = input
							end
						)
						vim.cmd([[redraw]])
						return path
					end,
					cwd = "${workspaceFolder}",
					stopOnEntry = false,
				},
			}
		end,
	},
	{
		"mfussenegger/nvim-dap-python",
		dependencies = { "mfussenegger/nvim-dap" },
		event = "VeryLazy",
		config = function()
			local dap_python = require("dap-python")
			dap_python.setup("~/.virtualenvs/debugpy/bin/python")

			-- Allow stepping into code from libraries
			for _, config in pairs(require("dap").configurations.python) do
				config.justMyCode = false
			end
		end,
	},
}
