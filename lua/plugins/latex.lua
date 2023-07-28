return{
    {
        'lervag/vimtex',
        -- ft = "tex",
        config = function()
            vim.cmd([[
                filetype plugin indent on
                let g:vimtex_view_method = 'skim'
            ]])
        end
    },
}
