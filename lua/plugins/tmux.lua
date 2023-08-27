return{
    "aserowy/tmux.nvim",
    keys = {
        {"<C-h>"},
        {"<C-j>"},
        {"<C-k>"},
        {"<C-l>"},
    },
    config = function()
        require("tmux").setup() 
    end
}
