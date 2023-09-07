return{
    {
        "olimorris/onedarkpro.nvim",
        priority = 1000, -- Ensure it loads first
        -- config = function()
        --     vim.cmd("colorscheme onedark")
        -- end
    },
    {
          "folke/tokyonight.nvim",
          lazy = false,
          priority = 1000,
          opts = {},
          config = function()
              vim.cmd("colorscheme tokyonight-night")
          end
    },
}
