return {
	{
		"simrat39/rust-tools.nvim",
		ft = { "rust" },
		dependencies = {
			"mfussenegger/nvim-dap",
			"rcarriga/nvim-dap-ui",
			"theHamsta/nvim-dap-virtual-text",
		},
		config = function()
			-- Update this path
			local extension_path = "/Users/weiyiqin/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/"
			local codelldb_path = "/Users/weiyiqin/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/adapter/codelldb"
			local liblldb_path = "/Users/weiyiqin/.vscode/extensions/vadimcn.vscode-lldb-1.10.0/lldb/lib/liblldb.dylib"
			local this_os = vim.loop.os_uname().sysname

			-- The path in windows is different

			local opts = {
				-- ... other configs
				dap = {
					adapter = require("rust-tools.dap").get_codelldb_adapter(codelldb_path, liblldb_path),
				},
			}

			-- Normal setup
			require("rust-tools").setup(opts)
		end,
	},
}
