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
}
