return {
	"rcarriga/nvim-dap-ui",
	dependencies = {
		"mfussenegger/nvim-dap",
		"nvim-neotest/nvim-nio",
		{
			"theHamsta/nvim-dap-virtual-text",
			opts = {
				highlight_new_as_changed = true,
				all_frames = true,
			},
		},
		{
			"mfussenegger/nvim-dap-python",
			config = function()
				require("dap-python").setup("uv")
			end,
		},
	},
	event = "UIEnter",
	config = function()
		-- Setup DAP
		local dap = require("dap")
		dap.adapters.cppdbg = {
			id = "cppdbg",
			type = "executable",
			command = vim.fn.stdpath("data") .. "/mason/bin/OpenDebugAD7",
		}
		dap.adapters.codelldb = {
			type = "executable",
			command = vim.fn.stdpath("data") .. "/mason/bin/codelldb",
		}
		dap.adapters.lldb = {
			type = "executable",
			command = vim.fn.exepath("lldb-dap"), -- must be absolute path
			name = "lldb",
		}

		dap.configurations.cpp = {
			{
				name = "Launch file (lldb-dap)",
				type = "lldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false, -- do not stop at dyld_start
				preRunCommands = {
					"breakpoint set -n main -o true", -- one shot breakpoint at main
				},
				args = {},
				runInTerminal = true,
			},
			{
				name = "Launch file (codelldb)",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false, -- do not stop at dyld_start
				preRunCommands = {
					"breakpoint set -n main -o true", -- one shot breakpoint at main
				},
			},
			{
				name = "Launch file (cpptools)",
				type = "cppdbg",
				request = "launch",
				MIMode = (vim.fn.executable("gdb") == 1) and "gdb" or "lldb",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopAtEntry = true, -- stop at main
			},
		}
		dap.configurations.c = dap.configurations.cpp
		dap.configurations.rust = {
			{
				name = "Launch file (codelldb)",
				type = "codelldb",
				request = "launch",
				program = function()
					return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
				end,
				cwd = "${workspaceFolder}",
				stopOnEntry = false, -- do not stop at dyld_start / main for rust
			},
		}

		-- DAP Signs
		vim.api.nvim_set_hl(0, "DapStoppedLine", { bg = "#363222" })
		vim.fn.sign_define("DapBreakpoint", { text = " ", texthl = "DapBreakpoint", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapBreakpointCondition",
			{ text = " ", texthl = "DapBreakpointCondition", linehl = "", numhl = "" }
		)
		vim.fn.sign_define(
			"DapBreakpointRejected",
			{ text = " ", texthl = "DapBreakpointRejected", linehl = "", numhl = "" }
		)
		vim.fn.sign_define("DapLogPoint", { text = " ", texthl = "DapLogPoint", linehl = "", numhl = "" })
		vim.fn.sign_define(
			"DapStopped",
			{ text = " ", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "DapStoppedLine" }
		)

		-- DAP Keymaps
		vim.keymap.set("n", "<F5>", dap.continue, { desc = "DAP: Continue" })
		vim.keymap.set("n", "<F9>", dap.toggle_breakpoint, { desc = "DAP: Toggle Breakpoint" })
		vim.keymap.set("n", "<F10>", dap.step_over, { desc = "DAP: Step Over" })
		vim.keymap.set("n", "<F11>", dap.step_into, { desc = "DAP: Step Into" })
		vim.keymap.set("n", "<F12>", dap.step_out, { desc = "DAP: Step Out" })
		vim.keymap.set("n", "<leader>dq", dap.terminate, { desc = "DAP: Terminate" })

		-- Setup DAP UI
		local dapui = require("dapui")
		dapui.setup()

		-- Auto open and close dapui
		dap.listeners.before.attach.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.launch.dapui_config = function()
			dapui.open()
		end
		dap.listeners.before.event_terminated.dapui_config = function()
			dapui.close()
		end
		dap.listeners.before.event_exited.dapui_config = function()
			dapui.close()
		end
	end,
}
