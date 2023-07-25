return{
    {
        'hrsh7th/nvim-cmp',
        event = "InsertEnter",
        dependencies = {
            'neovim/nvim-lspconfig',
            'hrsh7th/cmp-nvim-lsp',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'hrsh7th/vim-vsnip-integ',
            'rafamadriz/friendly-snippets',
            'hrsh7th/cmp-path',
        },
        config = function()
            vim.cmd("set completeopt=menu,menuone,noselect")
            local cmp_kinds = {
            Text = "",
            Method = "󰆧",
            Function = "󰊕",
            Constructor = "",
            Field = "ﴲ",
            Variable = "",
            Class = "",
            Interface = "ﰮ",
            Module = "",
            Property = "襁",
            Unit = "",
            Value = "",
            Enum = "",
            Keyword = "",
            Snippet = "",
            Color = "",
            File = "󰈙",
            Reference = "",
            Folder = "󰉋",
            EnumMember = "",
            Constant = "ﲀ",
            Struct = "פּ",
            Event = "",
            Operator = "󰆕",
            TypeParameter = "󰅲"
            }

            -- Setup nvim-cmp.
            -- local cmp = require'cmp'
            local cmp = require("cmp")
            -- local lspkind = require('lspkind')
            cmp.setup({
            window = {
            completion = { -- rounded border; thin-style scrollbar
            border = 'rounded',
            autocomplete = true,
            scrollbar = '║',
            },
            documentation = { -- no border; native-style scrollbar
            border = 'rounded',
            scrollbar = '║',
            -- other options
            },
            },
            formatting = {
            -- format = lspkind.cmp_format({with_text = true, maxwidth = 50})
                fields = { "kind", "abbr" },
            format = function(_, vim_item)
            vim_item.kind = cmp_kinds[vim_item.kind] or ""
            return vim_item
            end,
            },
            snippet = {
            -- REQUIRED - you must specify a snippet engine
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body) -- For `vsnip` users.
                -- require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
                -- require'snippy'.expand_snippet(args.body) -- For `snippy` users.
            end,
            },
            mapping = {
            -- ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
            -- ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
            -- ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
            -- ['<C-y>'] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
            -- ['<C-e>'] = cmp.mapping({
            --   i = cmp.mapping.abort(),
            --   c = cmp.mapping.close(),
            -- }),
            -- ['<CR>'] = cmp.mapping.confirm({ select = true }),
            -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
            -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
            -- ['<C-Space>'] = cmp.mapping.complete(),
            -- ['<C-e>'] = cmp.mapping.abort(),
            ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            ["<C-n>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif vim.fn["vsnip#available"](1) == 1 then
                feedkey("<Plug>(vsnip-expand-or-jump)", "")
            elseif has_words_before() then
                cmp.complete()
            else
                fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
            end
            end, { "i", "s" }),

            ["<C-p>"] = cmp.mapping(function()
            if cmp.visible() then
                cmp.select_prev_item()
            elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                feedkey("<Plug>(vsnip-jump-prev)", "")
            end
            end, { "i", "s" }),
            },
            sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'path' },
            { name = 'vsnip' }, -- For vsnip users.
            -- { name = 'luasnip' }, -- For luasnip users.
            -- { name = 'ultisnips' }, -- For ultisnips users.
            -- { name = 'snippy' }, -- For snippy users.
            })
            })

            -- Setup lspconfig.
            local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
            -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
            --  require('lspconfig')['vimls'].setup {
            --    capabilities = capabilities
            --  }
            vim.cmd([[
            highlight! CmpItemAbbrDeprecated guibg=blue gui=strikethrough guifg=#808080
            " blue
            highlight! CmpItemAbbrMatch guibg=NONE guifg=#e6cf71"#e06c75"#569CD6
            highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#c678dd
            " light blue
            highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
            highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
            highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
            " pink
            highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
            highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
            " front
            highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
            highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
            highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
            highlight MsgArea guifg=reverse guibg=reverse 
            ]])
        end,
    },
    {
        'hrsh7th/cmp-nvim-lsp',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/nvim-cmp',
        },
    },
    {
        'hrsh7th/cmp-vsnip',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/nvim-cmp',
            'hrsh7th/vim-vsnip',
        },
    },
    {
        'hrsh7th/vim-vsnip',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-vsnip',
        },
    },
    {
        'hrsh7th/vim-vsnip-integ',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
        },
    },
    {
        'rafamadriz/friendly-snippets',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/nvim-cmp',
            'hrsh7th/cmp-vsnip',
            'hrsh7th/vim-vsnip',
            'hrsh7th/vim-vsnip-integ',
        },
    },
    {
        'hrsh7th/cmp-path',
        event = "InsertEnter",
        dependencies = {
            'hrsh7th/nvim-cmp',
        },
    },
}