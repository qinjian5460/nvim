return{
    {
        'nvim-lualine/lualine.nvim',
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'tokyonight',
                    globalstatus=true,
                    component_separators = { left = '', right = ''},
                    section_separators = { left = '', right = ''},
                    disabled_filetypes = {'dashboard'},
                    always_divide_middle = true,
                },
                sections = {
                    lualine_a = {'mode'},
                    lualine_b = {'branch', 'diff', 'diagnostics'},
                    lualine_c = {'filename'},
                    lualine_x = {'encoding', 'fileformat', 'filetype'},
                    lualine_y = {'progress'},
                    lualine_z = {'location'}
                },
                inactive_sections = {
                    lualine_a = {},
                    lualine_b = {},
                    -- lualine_c = {'filename'},
                    -- lualine_x = {'location'},
                    lualine_y = {},
                    lualine_z = {}
                },
                tabline = {},
                extensions = {}
                }
            end
    },
    -- {
    --     'mbbill/undotree',
    -- },
    {
        'kevinhwang91/rnvimr',
        cmd = "RnvimrToggle",
        config = function()
            vim.cmd("let g:rnvimr_enable_ex = 1")
            vim.cmd("let g:rnvimr_enable_picker = 1")
            vim.cmd("let g:rnvimr_draw_border = 1")
            vim.cmd("let g:rnvimr_hide_gitignore = 1")
            vim.cmd("let g:rnvimr_border_attr = {'fg': 14, 'bg': -1}")
            vim.cmd("let g:rnvimr_enable_bw = 1")
            vim.cmd("highlight link RnvimrNormal CursorLine")
            vim.cmd([[
                nnoremap <silent> <M-o> :RnvimrToggle<CR>
                tnoremap <silent> <M-o> <C-\><C-n>:RnvimrToggle<CR>

                tnoremap <silent> <M-i> <C-\><C-n>:RnvimrResize<CR>

                tnoremap <silent> <M-l> <C-\><C-n>:RnvimrResize 1,8,9,11,5<CR>

                tnoremap <silent> <M-y> <C-\><C-n>:RnvimrResize 6<CR>

                let g:rnvimr_action = {
                        \ '<C-t>': 'NvimEdit tabedit',
                        \ '<C-x>': 'NvimEdit split',
                        \ '<C-v>': 'NvimEdit vsplit',
                        \ 'gw': 'JumpNvimCwd',
                        \ 'yw': 'EmitRangerCwd'
                        \ }

                let g:rnvimr_layout = { 'relative': 'editor',
                        \ 'width': float2nr(round(0.6 * &columns)),
                        \ 'height': float2nr(round(0.6 * &lines)),
                        \ 'col': float2nr(round(0.2 * &columns)),
                        \ 'row': float2nr(round(0.2 * &lines)),
                        \ 'style': 'minimal' }
            ]])
                    end
                },
                {
                    'gelguy/wilder.nvim',
                    keys = {
                        { ":", },
                        {"/"}
                    },
                    config = function()
                        vim.cmd([[
                call wilder#setup({
                \ 'modes': [':', '/', '?'],
                \ 'next_key': '<C-n>',
                \ 'previous_key': '<C-p>',
                \ 'accept_key': '<Down>',
                \ 'reject_key': '<Up>',
                \ })
            "
            let s:scale = ['#f4468f', '#fd4a85', '#ff507a', '#ff566f', '#ff5e63',
                \ '#ff6658', '#ff704e', '#ff7a45', '#ff843d', '#ff9036',
                \ '#f89b31', '#efa72f', '#e6b32e', '#dcbe30', '#d2c934',
                \ '#c8d43a', '#bfde43', '#b6e84e', '#aff05b','#aff05e']


            let s:gradient = map(s:scale, {i, fg -> wilder#make_hl(
                \ 'WilderGradient' . i, 'Pmenu', [{}, {}, {'foreground': fg}]
                \ )})

            call wilder#set_option('renderer', wilder#popupmenu_renderer(wilder#popupmenu_border_theme({
                    \ 'highlighter': wilder#highlighter_with_gradient([
                    \    wilder#basic_highlighter(),
                    \]),
                \ 'highlights': {
                \   'gradient': s:gradient,
                \ },
                \ 'border': 'rounded',
                \ 'left': [
                \   ' ', wilder#popupmenu_devicons(),
                \ ],
                \ 'right': [
                \   ' ', wilder#popupmenu_scrollbar(),
                \ ],
                \ })))
            ]])
        end
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        cmd = "Neotree",
        branch = "v3.x",
        dependencies = {
          "nvim-lua/plenary.nvim",
          "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
          "MunifTanjim/nui.nvim",
        }
    },
    -- {
    --     'nvim-tree/nvim-tree.lua',
    --     cmd = "NvimTreeToggle",
    --     config = function()
    --         vim.g.loaded_netrw = 1
    --         vim.g.loaded_netrwPlugin = 1
    --
    --         -- set termguicolors to enable highlight groups
    --         vim.opt.termguicolors = true
    --
    --         require("nvim-tree").setup({
    --         sort_by = "case_sensitive",
    --         view = {
    --             width = 30,
    --         },
    --         renderer = {
    --             group_empty = true,
    --         },
    --         filters = {
    --             dotfiles = true,
    --         },
    --         })
    --     end
    -- },
    -- {
    --     'lewis6991/gitsigns.nvim',
    --     option = function()
    --         require('gitsigns').setup()
    --     end
    -- },
    {
        'akinsho/bufferline.nvim', 
        version = "*", 
        dependencies = 'nvim-tree/nvim-web-devicons',
        config = function ()
            require("bufferline").setup{
                options = {
                    diagnostics = "nvim_lsp",
                    indicator = {
                        icon = '▎', -- this should be omitted if indicator style is not 'icon'
                        style = 'icon',
                    },
                },
            }
        end,
    },
    -- {
    --     'romgrk/barbar.nvim',
    --     dependencies = {
    --     'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
    --     'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
    --     },
    --     init = function() vim.g.barbar_auto_setup = false end,
    --     opts = {
    --     -- lazy.nvim will automatically call setup for you. put your options here, anything missing will use the default:
    --     -- animation = true,
    --     -- insert_at_start = true,
    --     -- …etc.
    --     },
    --     version = '^1.0.0', -- optional: only update when a new 1.x version is released
    -- },
    {
        't9md/vim-choosewin',
        config = function()
            vim.cmd("nmap <Leader>a <Plug>(choosewin)")
            vim.cmd("let g:choosewin_overlay_enable = 1")
        end
    },
    {
        "folke/trouble.nvim",
        cmd = "Trouble",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require('trouble').setup()
        end
    },
    {
        'glepnir/dashboard-nvim',
        event = 'VimEnter',
        dependencies = { {'nvim-tree/nvim-web-devicons'}},
        config = function()
            require('dashboard').setup {
                theme = 'hyper', --  theme is doom and hyper default is hyper
                config = {
                header = {
                    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣤⠶⠓⢛⣫⠽⠟⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠟⠁⠀⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣻⣄⠀⢰⠋⠴⠖⠚⠛⠉⠉⠙⠛⠛⠒⠶⠤⣤⣀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠶⠚⠛⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠲⣄⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀]],
                    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠙⢦⡀⠀⠀⠀⠀⠀⠀⠀]],
                    [[⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠑⢦⠀⠀⠀⠀⠀⠀]],
                    [[⠀⠀⠀⠀⠀⠀⠀⢀⡴⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⢷⡄⠀⠀⠀⠀]],
                    [[⠀⠀⠀⠀⠀⠀⣠⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠻⣆⠀⠀⠀]],
                    [[⠀⠀⠀⠀⢀⡼⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠹⡆⠀⠀]],
                    [[⠀⠀⠀⣠⠟⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⣿⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢰⣿⣦⡀]],
                    [[⠀⠀⢰⠏⢀⣀⠀⠀⠀⠀⠀⠀⠀⢀⠏⡟⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢠⠈⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢷⠉⠁]],
                    [[⠀⣰⣏⡴⢋⡏⠀⠀⠀⠀⠀⠀⠀⡌⠀⣧⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⠀⠘⡄⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀]],
                    [[⠐⠛⠋⠀⣼⠀⠀⠀⠀⠀⠀⢀⡞⠀⠀⢹⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡆⣀⡤⠵⡋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⠀]],
                    [[⠀⠀⠀⢀⡇⠀⠀⠀⠀⠀⠉⠎⠓⠒⠒⠞⡦⠀⠀⠀⠀⠀⠀⠀⠀⠒⠒⢈⡇⠀⠀⠀⠙⢄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠀]],
                    [[⠀⠀⠀⢸⠇⠀⠀⠀⠀⢠⠎⠀⠀⠀⠀⠀⢣⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣸⣀⣤⣤⣤⣤⡄⡇⠀⠀⠀⠀⠔⠂⠐⠢⡄⠀⠀⠀⣿⠀⠀]],
                    [[⠀⠀⠀⢸⠀⠀⠀⠀⢰⣃⣀⣀⣀⣀⣤⣤⣤⡧⡀⠀⢀⠢⣄⠀⠀⠛⠛⡿⠛⠛⣻⣿⡅⠀⡇⠀⢀⠀⠘⠀⠀⠀⠀⠈⡆⠀⢠⣹⡄⠀]],
                    [[⠀⠀⠀⠸⡇⠀⠀⠀⣏⠙⠛⠛⠋⠉⣻⣿⠀⠀⠈⠓⠼⠀⠀⠑⠢⡀⢠⠇⠀⠀⠟⠉⠃⠀⡇⢀⠟⣆⡇⠀⠀⠀⠀⠀⣻⢀⡟⠉⠿⡦]],
                    [[⠀⠀⠀⠀⢷⠀⠀⠀⡏⣧⠀⠀⠀⠀⠿⠉⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠀⠀⠀⣇⠞⠀⠹⠁⠀⠀⠀⠀⢀⣧⠟⠁⠀⠀⠀]],
                    [[⠀⠀⠀⠀⠘⢧⠀⠀⢧⢸⡄⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠰⠃⠀⠀⠀⠀⣀⣀⣀⡴⠋⠛⠶⣄⠀⠀⠀]],
                    [[⠀⠀⠀⠀⠀⠙⢷⣄⣸⣾⠃⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⠎⠉⠒⢄⠀⠀⠀⠀⠈⢳⡄⠀]],
                    [[⠀⠀⠀⠀⠀⠀⠀⣴⣿⡏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⠤⠤⠤⠤⠤⠤⠄⠠⠔⠚⠉⠉⠁⠀⠀⠀⢸⠀⠀⠀⠀⢻⡗⢿⠀]],
                    [[⠀⠀⠀⠀⠀⠀⠸⠟⠁⢹⡷⣤⣀⣀⣤⠤⠶⠒⠛⠋⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢸⠀⢀⡄⠀⢸⠇⠀⠀]],
                    [[⠀⠀⠀⠀⠀⠀⠀⠀⢠⠏⠈⠉⠉⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣷⡚⠙⠶⠋⠀⠀⠀]],
                    [[⠀⠀⠀⠀⠀⠀⠀⠀⡾⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣀⣀⣤⠤⠤⠂⠀⠘⠈⢈⡇⠀⠀⠀⠀⠀⠀]],
                    [[⠀⠀⠀⠀⠀⠀⠀⠸⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠉⠉⠉⠉⠉⠀⠀⠀⠀⠀⠀⠀⠀⠀⣸⠃⠀⠀⠀⠀⠀⠀]],
                },
                shortcut = {
                    { desc = '󰊳 Lazy', group = '@property', action = 'Lazy', key = 'u' },
                    {
                    icon = ' ',
                    icon_hl = '@variable',
                    desc = 'Files',
                    group = 'Label',
                    action = 'Telescope find_files',
                    key = 'f',
                    },
                    {
                    desc = ' project',
                    group = 'DiagnosticHint',
                    action = 'Telescope projects',
                    key = 'a',
                    },
                    {
                    desc = ' keymap',
                    group = 'Number',
                    action = 'Telescope keymaps',
                    key = 'd',
                    },
                },
                },
            }
        end
    },
    {
        'nvimdev/lspsaga.nvim',
        -- event = "InsertEnter",
        event = 'LspAttach',
        dependencies = {
        'nvim-treesitter/nvim-treesitter', -- optional
        'nvim-tree/nvim-web-devicons'     -- optional
        },
        config = function()
            require("lspsaga").setup{
            outline = {
                win_position = "left",
                win_with = "",
                win_width = 30,
                preview_width= 0.4,
                show_detail = true,
                auto_preview = true,
                auto_refresh = true,
                auto_close = true,
                layout = 'float',
                custom_sort = nil,
                keys = {
                expand_or_jump = 'o',
                quit = "q",
                },
            },
                diagnostic = {
                on_insert = false,
                on_insert_follow = false,
                insert_winblend = 0,
                show_code_action = true,
                show_source = true,
                jump_num_shortcut = true,
                max_width = 0.7,
                max_height = 0.6,
                max_show_width = 0.9,
                max_show_height = 0.6,
                text_hl_follow = true,
                border_follow = true,
                extend_relatedInformation = false,
                keys = {
                exec_action = 'o',
                quit = 'q',
                expand_or_jump = '<CR>',
                quit_in_show = { 'q', '<ESC>' },
                },
            },
            }
        end
    },
    {
        "MunifTanjim/nui.nvim",
        event = "InsertEnter",
    },
    {
        "rcarriga/nvim-notify",
        event = "InsertEnter",
        config = function()
            require("notify").setup({
                background_colour="#000000"
            })
        end
    },
    {
        "folke/noice.nvim",
        -- event = "VeryLazy",
        event = "InsertEnter",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = function()
            require("noice").setup({
                cmdline = {
                view = "cmdline",
                format = {
                    search_down = {
                    view = "cmdline",
                    },
                    search_up = {
                    view = "cmdline",
                    },
                },
                },
            })
        end
    },
    {
      "folke/which-key.nvim",
      event = "VeryLazy",
      init = function()
      vim.o.timeout = true
      vim.o.timeoutlen = 300
      end,
      opts = {
      }  
    },
    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        opts={},
    },
    {
        'akinsho/toggleterm.nvim', 
        cmd = "ToggleTerm",
        version = "*", 
        opts = {--[[ things you want to change go here]]},
    },
    {
        "folke/edgy.nvim",
        event = "VeryLazy",
        init = function()
          vim.opt.laststatus = 3
          vim.opt.splitkeep = "screen"
        end,
        opts = {
            close_when_all_hidden = false,
            bottom = {
                        "Trouble",
                        {
                          ft = "toggleterm",
                          size = { height = 0.2 },
                          -- exclude floating windows
                          filter = function(buf, win)
                            return vim.api.nvim_win_get_config(win).relative == ""
                          end,
                        },
                        {
                            ft = "help",
                            size = { height = 0.4 },
                            -- only show help buffers
                            filter = function(buf)
                              return vim.bo[buf].buftype == "help"
                            end,
                        },
            },
            left = {
                {
                  title = "Neo-Tree",
                  ft = "neo-tree",
                  filter = function(buf)
                    return vim.b[buf].neo_tree_source == "filesystem"
                  end,
                  size = { height = 0.5 },
                },
                {
                  ft = "Outline",
                  pinned = true,
                  open = "SymbolsOutline",
                },
                -- {
                --   title = "Neo-Tree Git",
                --   ft = "neo-tree",
                --   filter = function(buf)
                --     return vim.b[buf].neo_tree_source == "git_status"
                --   end,
                --   pinned = true,
                --   open = "Neotree position=right git_status",
                -- },
                -- {
                --   title = "Neo-Tree Buffers",
                --   ft = "neo-tree",
                --   filter = function(buf)
                --     return vim.b[buf].neo_tree_source == "buffers"
                --   end,
                --   pinned = true,
                --   open = "Neotree position=top buffers",
                -- },
            },
        }
    },
}
