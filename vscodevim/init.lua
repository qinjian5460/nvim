local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
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
        -- event = "InsertEnter",
        opts = {} -- this is equalent to setup({}) function
      },
      {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability; omit to use `main` branch for the latest features
        -- event = "VeryLazy",
        config = function()
          require("nvim-surround").setup({
              -- Configuration here, or leave empty to use defaults
          })
        end
      },
      {
        'numToStr/Comment.nvim',
        keys = { "gc", mode = "n",},
        keys = { "gcc", mode = "v" },
        config = function()
            require("Comment").setup()
        end
      },
      {
        "folke/flash.nvim",
        -- event = "VeryLazy",
        ---@type Flash.Config
        -- opts = {},
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
          "nvim-treesitter/nvim-treesitter",
          -- event = 'LspAttach',
          build = ":TSUpdate",
          config = function()
              require'nvim-treesitter.configs'.setup {
                  highlight = {
                    enable = true,
                    custom_captures = {
                      -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
                      ["foo.bar"] = "Identifier",
                    },
                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                  },
                  refactor = {
                    highlight_definitions = { enable = true },
                    highlight_current_scope = { enable = true },
                  },
                  -- rainbow = {
                  --   enable = true,
                  --   -- list of languages you want to disable the plugin for
                  --   disable = { 'jsx', 'cpp' },
                  --   -- Which query to use for finding delimiters
                  --   query = 'rainbow-parens',
                  --   -- Highlight the entire buffer all at once
                  --   strategy = require('ts-rainbow').strategy.global,
                  -- },
                  --   playground = {
                  --   enable = true,
                  --   disable = {},
                  --   updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
                  --   persist_queries = false, -- Whether the query persists across vim sessions
                  --   keybindings = {
                  --     toggle_query_editor = 'o',
                  --     toggle_hl_groups = 'i',
                  --     toggle_injected_languages = 't',
                  --     toggle_anonymous_nodes = 'a',
                  --     toggle_language_display = 'I',
                  --     focus_language = 'f',
                  --     unfocus_language = 'F',
                  --     update = 'R',
                  --     goto_node = '<cr>',
                  --     show_help = '?',
                  --   },
                  -- }
                }
          end
      },
      -- {
      --     'HiPhish/nvim-ts-rainbow2',
      --     event = 'LspAttach',
      --     dependencies = {
      --     "nvim-treesitter/nvim-treesitter",
      --     },
      -- },
})
vim.keymap.set("i", "<C-,><C-,>", "<><Esc>i", {noremap = true})
vim.keymap.set("n", "H", "^", {noremap = true})
vim.keymap.set("n", "L", "$", {noremap = true})
vim.keymap.set("v", "H", "^", {noremap = true})
vim.keymap.set("v", "L", "$", {noremap = true})
-- vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>:setlocal winhighlight=Normal:InactiveWindow<CR>", {noremap = true})
-- vim.keymap.set("n", "<leader>t", ":Neotree toggle<CR>:setlocal winhighlight=Normal:InactiveWindow<CR>", {noremap = true})
-- vim.keymap.set("", "<up>", ":res +5<CR>", {noremap = true})
-- vim.keymap.set("", "<down>", ":res -5<CR>", {noremap = true})
-- vim.keymap.set("", "<left>", ":vertical resize-5<CR>", {noremap = true})
-- vim.keymap.set("", "<right>", ":vertical resize+5<CR>", {noremap = true})
-- vim.keymap.set("n", "<leader>3", ":Neotree toggle git_status<CR>", {noremap = true})
-- vim.keymap.set("n", "<leader>4", ":Neotree toggle buffers<CR>", {noremap = true})
vim.keymap.set("n", "<tab>k", "<Cmd>call VSCodeNotify('workbench.action.nextEditorInGroup')<CR>", {noremap = true})
vim.keymap.set("n", "<tab>j", "<Cmd>call VSCodeNotify('workbench.action.previousEditorInGroup')<CR>", {noremap = true})
vim.keymap.set("n", "<leader>l", "<Cmd>call VSCodeNotify('workbench.action.splitEditor')<CR>", {noremap = true})
vim.keymap.set("n", "<leader>j", "<Cmd>call VSCodeNotify('workbench.action.splitEditorDown')<CR>", {noremap = true})
vim.keymap.set("n", "<C-l>", "<Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupRight')<CR>", {noremap = true})
vim.keymap.set("n", "<C-h>", "<Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupLeft')<CR>", {noremap = true})
vim.keymap.set("n", "<C-j>", "<Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupDown')<CR>", {noremap = true})
vim.keymap.set("n", "<C-k>", "<Cmd>call VSCodeNotify('workbench.action.moveActiveEditorGroupUp')<CR>", {noremap = true})
