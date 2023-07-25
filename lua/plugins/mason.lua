return{
    {
        "williamboman/mason.nvim",
        build = ":MasonUpdate", -- :MasonUpdate updates registry contents
        config = function()
            require("mason").setup {}
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            vim.fn.sign_define(
                "LspDiagnosticsSignError",
                { texthl = "LspDiagnosticsSignError", text = "ﴞ ", numhl = "LspDiagnosticsSignError" }
                )
                vim.fn.sign_define(
                "LspDiagnosticsSignWarning",
                { texthl = "LspDiagnosticsSignWarning", text = "", numhl = "LspDiagnosticsSignWarning" }
                )
                vim.fn.sign_define(
                "LspDiagnosticsSignHint",
                { texthl = "LspDiagnosticsSignHint", text = "", numhl = "LspDiagnosticsSignHint" }
                )
                vim.fn.sign_define(
                "LspDiagnosticsSignInformation",
                { texthl = "LspDiagnosticsSignInformation", text = "", numhl = "LspDiagnosticsSignInformation" }
                )
                local signs = { Error = " ", Warn = " ", Hint = "ﴞ ", Info = " " }
                for type, icon in pairs(signs) do
                local hl = "DiagnosticSign" .. type
                vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
                end
                -- vim.diagnostic.config({
                --   virtual_text = {
                --     prefix = '', -- Could be '●', '▎', 'x'
                --   }
                -- })
                vim.diagnostic.config({
                virtual_text = false,
                signs = true,
                underline = false,
                update_in_insert = true,
                severity_sort = true,
                })
                -- You will likely want to reduce updatetime which affects CursorHold
                -- note: this setting is global and should be set only once
                -- vim.o.updatetime = 250
                -- vim.cmd [[autocmd! CursorHold,CursorHoldI * lua vim.diagnostic.open_float(nil, {focus=false})]]


                -- vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=#1f2335]]
                -- vim.cmd [[autocmd! ColorScheme * highlight NormalFloat guibg=reverse]]
                -- vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=#1f2335]]
                -- vim.cmd [[autocmd! ColorScheme * highlight FloatBorder guifg=white guibg=reverse]]

                local border = {
                    {"▔", "FloatBorder"},
                    {"▔", "FloatBorder"},
                    {"🭾", "FloatBorder"},
                    {"▕", "FloatBorder"},
                    {"🭿", "FloatBorder"},
                    {"▁", "FloatBorder"},
                    {"🭼", "FloatBorder"},
                    {"▏", "FloatBorder"},
                }
                require'lspconfig'.pylsp.setup{}
                -- require'lspconfig'.pyright.setup{}
                require'lspconfig'.vimls.setup{}
                -- require'lspconfig'.lua_ls.setup{}
                require'lspconfig'.marksman.setup{}
                require'lspconfig'.rust_analyzer.setup{}
                require'lspconfig'.clangd.setup{}
                require'lspconfig'.jsonls.setup{}
                require'lspconfig'.lua_ls.setup{}
        end
    },
    {
        'nvim-lua/lsp-status.nvim',
    },
}