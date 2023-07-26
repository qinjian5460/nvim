return{
      {
        'nvim-telescope/telescope.nvim', tag = '0.1.2',
        dependencies = { 'nvim-lua/plenary.nvim', },
        config = function()
            require('telescope').setup{
                -- pickers = {
                --     find_files = {
                --         theme = "dropdown",
                --     },
                -- },
                -- extensions = {
                --     'projects',
                -- },
            }
            require('telescope').load_extension('projects')
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
}
