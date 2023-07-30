require("config.lazy") 
require("config.keymaps")
require("config.default")
require("config.highlight")
if vim.g.neovide then
    require("config.neovide")-- Put anything you want to happen only in Neovide here
end

