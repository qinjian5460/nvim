return{
      {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = { 
            'nvim-lua/plenary.nvim', 
            "debugloop/telescope-undo.nvim",
            "ahmedkhalf/project.nvim", 
        },
        config = function()
            require('telescope').setup({
                extensions = {
                    projects = {},
                    undo = {},
                },
                -- pickers = {
                --     find_files = {
                --         theme = "dropdown",
                --     },
                -- },
                -- extensions = {
                --     'projects',
                -- },
            })
            require('telescope').load_extension('projects')
            require("telescope").load_extension("undo")
        end
      },
      {
        "ahmedkhalf/project.nvim", 
        cmd = "Telescope projects",
        config = function ()
            require("project_nvim").setup {
                    
            }
        end
      },
      {
        "debugloop/telescope-undo.nvim",
        cmd = "Telescope undo",
      },
}
