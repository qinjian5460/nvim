return{
    {
        "sindrets/diffview.nvim",
        -- cmd = "DiffviewToggleFiles",
        keys = {"<leader>g"},
        cmd = "DiffviewOpen",
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = "LazyGit",
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    {
        'lewis6991/gitsigns.nvim',
        -- option = function()
        --     require('gitsigns').setup()
        -- end
        config = function ()
            require('gitsigns').setup{
                current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
            }
        end,
    },
}
