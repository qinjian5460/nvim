return{
    {
        "CRAG666/code_runner.nvim", 
        event = "InsertEnter",
        config = function()
            require('code_runner').setup({
            -- put here the commands by filetype
            filetype = {
                    java = "cd $dir && javac $fileName && java $fileNameWithoutExt",
                    python = "python3 -u",
                    typescript = "deno run",
                    rust = "cd $dir && rustc $fileName && $dir/$fileNameWithoutExt"
                },
            })
        end
    },
    {
        'mfussenegger/nvim-dap',
        keys = {"<leader>d",},
        config = function()
                local dap, dapui = require("dap"), require("dapui")
                dap.listeners.after.event_initialized["dapui_config"] = function()
                dapui.open()
                end
                dap.listeners.before.event_terminated["dapui_config"] = function()
                dapui.close()
                end
                dap.listeners.before.event_exited["dapui_config"] = function()
                dapui.close()
                end
                require("dapui").setup({
                icons = { expanded = "", collapsed = "", current_frame = "" },
                mappings = {
                    expand = { "<CR>", "<2-LeftMouse>" },
                    open = "o",
                    remove = "d",
                    edit = "e",
                    repl = "r",
                    toggle = "t",
                },
                element_mappings = {
                },
                layouts = {
                    {
                    elements = {
                        "watches",
                        "stacks",
                        "breakpoints",
                        { id = "scopes", size = 0.25 },
                    },
                    size = 40, -- 40 columns
                    position = "left",
                    },
                    {
                    elements = {
                        "repl",
                        "console",
                    },
                    size = 0.25, -- 25% of total lines
                    position = "bottom",
                    },
                },
                controls = {
                    enabled = true,
                    element = "repl",
                    icons = {
                    pause = "",
                    play = "",
                    step_into = "",
                    step_over = "",
                    step_out = "",
                    step_back = "",
                    run_last = "",
                    terminate = "",
                    },
                },
                floating = {
                    max_height = nil, -- These can be integers or a float between 0 and 1.
                    max_width = nil, -- Floats will be treated as percentage of your screen.
                    border = "single", -- Border style. Can be "single", "double" or "rounded"
                    mappings = {
                    close = { "q", "<Esc>" },
                    },
                },
                windows = { indent = 1 },
                render = {
                    max_type_length = nil, -- Can be integer or nil.
                    max_value_lines = 100, -- Can be integer or nil.
                }
                })
                dap.adapters.python = function(cb, config)
                if config.request == 'attach' then
                    ---@diagnostic disable-next-line: undefined-field
                    local port = (config.connect or config).port
                    ---@diagnostic disable-next-line: undefined-field
                    local host = (config.connect or config).host or '127.0.0.1'
                    cb({
                    type = 'server',
                    port = assert(port, '`connect.port` is required for a python `attach` configuration'),
                    host = host,
                    options = {
                        source_filetype = {'python', 'lua'},
                    },
                    })
                else
                    cb({
                    type = 'executable',
                    command = '/Users/weiyiqin/.local/share/nvim/mason/packages/debugpy/venv/bin/python3.10',
                    args = { '-m', 'debugpy.adapter' },
                    options = {
                        source_filetype = 'python',
                    },
                    })
                end
                end
                dap.configurations.python = {
                {
                    type = 'python'; -- the type here established the link to the adapter definition: `dap.adapters:want.python`
                    request = 'launch';
                    name = "Launch file";
                    program = "${file}"; -- This configuration will launch the current file if used.
                    pythonPath = '/opt/homebrew/Cellar/python@3.11/3.11.4_1/bin/python3'--function()
                },
                }
                dap.adapters["local-lua"] = {
                  type = "executable",
                  command = "node",
                  args = {
                    "/Users/weiyiqin/.vscode/extensions/tomblind.local-lua-debugger-vscode-0.3.3/extension/debugAdapter.js",
                  },
                  enrich_config = function(config, on_config)
                    if not config["extensionPath"] then
                      local c = vim.deepcopy(config)
                      -- 💀 If this is missing or wrong you'll see 
                      -- "module 'lldebugger' not found" errors in the dap-repl when trying to launch a debug session
                      c.extensionPath = "/Users/weiyiqin/.vscode/extensions/tomblind.local-lua-debugger-vscode-0.3.3/",
                      on_config(c)
                    else
                      on_config(config)
                    end
                  end,
                }
                dap.configurations.lua = {
                    {
                      name = 'Current file (local-lua-dbg, lua)',
                      type = 'local-lua',
                      request = 'launch',
                      cwd = '${workspaceFolder}',
                      program = {
                        lua = 'lua5.4',
                        file = '${file}',
                      },
                      args = {
                          '${workspaceFolder}',
                      },
                    },
                }
                -- require("dapui").setup()
                -- require("mason-nvim-dap").setup()
                -- require("nvim-dap-virtual-text").setup {
                -- highlight_changed_variables = false, all_frames = true
                -- }
        end
    },
    {
        "rcarriga/nvim-dap-ui",
        event = "InsertEnter",
        dependencies = {
            'mfussenegger/nvim-dap',
        },
        config = function()
            require("dapui").setup()
        end
    },
    {
        "jay-babu/mason-nvim-dap.nvim",
        event = "InsertEnter",
        dependencies = {
            'mfussenegger/nvim-dap',
        },
        config = function()
            require("mason-nvim-dap").setup()
        end
    },
    {
        'theHamsta/nvim-dap-virtual-text',
        event = "InsertEnter",
        dependencies = {
            'mfussenegger/nvim-dap',
        },
        config = function()
            require("nvim-dap-virtual-text").setup {
                highlight_changed_variables = true, all_frames = true
            }
        end
    },
}
