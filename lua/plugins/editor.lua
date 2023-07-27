return{
    {
        'max397574/better-escape.nvim',
        config = function()
          require("better_escape").setup {
            mapping = {"jj"}, -- a table with mappings to use
            timeout = vim.o.timeoutlen, -- the time in which the keys must be hit in ms. Use option timeoutlen by default
            clear_empty_lines = false, -- clear line after escaping if there is only whitespace
            keys = "<Esc>", -- keys used for escaping, if it is a function will use the result everytime
            -- example(recommended)
            -- keys = function()
            --   return vim.api.nvim_win_get_cursor(0)[2] > 1 and '<esc>l' or '<esc>'
            -- end,
        }
        end,
      },
      {
        'rainbowhxch/accelerated-jk.nvim',
        config = function()
          require('accelerated-jk').setup({
            mode = 'time_driven',
            enable_deceleration = false,
            acceleration_motions = {},
            acceleration_limit = 150,
            acceleration_table = { 7,12,17,21,24,26,28,30 },
            -- when 'enable_deceleration = true', 'deceleration_table = { {200, 3}, {300, 7}, {450, 11}, {600, 15}, {750, 21}, {900, 9999} }'
            deceleration_table = { {150, 9999} }
        })
          vim.api.nvim_set_keymap('n', 'j', '<Plug>(accelerated_jk_gj)', {})
          vim.api.nvim_set_keymap('n', 'k', '<Plug>(accelerated_jk_gk)', {})
        end
      },
      {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
      },
      {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
        end
      },
      -- {
      --   "lukas-reineke/indent-blankline.nvim",
      --   config = function()
      --     vim.g.indent_blankline_filetype_exclude = {
      --       "help",
      --       "dashboard",
      --       "barbar",
      --       "NvimTree",
      --       "Trouble",
      --         "mason",
      --     }
      --     -- vim.cmd [[highlight IndentBlanklineIndent1 guifg=#30465d guibg=#373a3b gui=nocombine]]
      --     vim.cmd [[highlight IndentBlanklineIndent1 guifg=#30465d guibg=#2c3b40 gui=nocombine]]
      --     vim.cmd [[highlight IndentBlanklineIndent2 guifg=#30465d guibg=#382f4b gui=nocombine]]
      --     vim.cmd [[highlight IndentBlanklineIndent3 guifg=#30465d guibg=#161e37 gui=nocombine]]
      --     vim.cmd("let g:indent_blankline_context_char = '▎'")
      --       require("indent_blankline").setup {
      --         show_current_context = true,
      --         show_current_context_start = true,
      --         char = "▎",
      --         char_highlight_list = {
      --             "IndentBlanklineIndent1",
      --             "IndentBlanklineIndent2",
      --             "IndentBlanklineIndent3",
      --             -- "IndentBlanklineIndent4",
      --         },
      --         space_char_highlight_list = {
      --             "IndentBlanklineIndent1",
      --             "IndentBlanklineIndent2",
      --             "IndentBlanklineIndent3",
      --             -- "IndentBlanklineIndent4",
      --         },
      --         show_trailing_blankline_indent = false,
      --     } 
      --   end
      -- },
      {
        'numToStr/Comment.nvim',
        config = function()
            require("Comment").setup()
        end
      },
      -- {
      --   'nvim-telescope/telescope.nvim', tag = '0.1.2',
      --   dependencies = { 'nvim-lua/plenary.nvim' },
      --   config = function()
      --       require('telescope').setup{}
      --   end
      -- },
      {
        'folke/lsp-colors.nvim',
        config = function()
            require("lsp-colors").setup({
              Error = "#db4b4b",
              Warning = "#e0af68",
              Information = "#0db9d7",
              Hint = "#10B981"
            })
        end
      },
      {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require'colorizer'.setup()
        end
      },
      {
        "folke/flash.nvim",
        event = "VeryLazy",
        ---@type Flash.Config
        opts = {},
        -- stylua: ignore
        keys = {
          { "s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
          { "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
          { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
          { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
          { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
        config = function ()
            -- require("flash").jump({
            --       modes = {
            --         char = {
            --           jump_labels = true,
            --         },
            --     },
            -- })
            -- require("flash").toggle(true)
        end
      },
      {
          "shellRaining/hlchunk.nvim", 
          event = { "UIEnter" },
          config = function()
              require('hlchunk').setup({
                  chunk = {
                    chars = {
                        horizontal_line = "─",
                        vertical_line = "│",
                        left_top = "╭",
                        left_bottom = "╰",
                        right_arrow = ">",
                    },
                    style = "#e5c07b",
                    },
                  blank = {
                    enable = true,
                    chars = {
                        " ",
                    },
                    style = {
                        -- { bg = vim.fn.synIDattr(vim.fn.synIDtrans(vim.fn.hlID("cursorline")), "bg", "gui") },
                        { bg = "#33373d", fg = "#8a8a8a" },
                        { bg = "#2a3740", fg = "#8a8a8a" },
                        { bg = "#332e4a", fg = "#8a8a8a" },
                    },
                }
            })
          end
      },
      {
          "mg979/vim-visual-multi",
          keys = { "<leader><C-n>", },
          config = function ()
                vim.keymap.set("n", "<leader><C-n>", "<Plug>(VM-Add-Cursor-At-Pos)", { noremap = true })
              vim.cmd([[
                let g:VM_maps = {}
                let g:VM_maps['Find Under']         = '<C-d>'           " replace C-n
                let g:VM_maps['Find Subword Under'] = '<C-d>'           " replace visual C-n
                let g:VM_maps["Select l"]           = '<S-Right>'       " start selecting left
                let g:VM_maps["Select h"]           = '<S-Left>'        " start selecting right
                let g:VM_maps["Select Cursor Down"] = '<C-n>'      " start selecting down
                let g:VM_maps["Select Cursor Up"]   = '<C-p>'        " start selecting up
              ]])
          end
      },
      {
        'declancm/cinnamon.nvim',
        event = { "UIEnter" },
        config = function() 
            require('cinnamon').setup() 
        end  
      },
}
