return{
    {
        'chipsenkbeil/distant.nvim',
        branch = 'v0.2',
        config = function()
          require('distant').setup {
            ['*'] = require('distant.settings').chip_default()
          }
        end
    },
}
