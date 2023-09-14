return{
    {
        'glacambre/firenvim',

        -- Lazy load firenvim
        -- Explanation: https://github.com/folke/lazy.nvim/discussions/463#discussioncomment-4819297
        lazy = not vim.g.started_by_firenvim,
        build = function()
            vim.fn["firenvim#install"](0)
        end,
        config = function ()
            vim.g.firenvim_config = {
                globalSettings = { 
                    alt = "all",
                    cmdlineTimeout = 3000
                },
                localSettings = {
                    [".*"] = {
                        cmdline  = "neovim",
                        content  = "text",
                        priority = 0,
                        selector = "textarea",
                        takeover = "never"
                    }
                }
            } 
        end,
    },
}
