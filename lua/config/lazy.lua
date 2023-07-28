local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)
-- Example using a list of specs with the default options
vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct

require("lazy").setup({
    -- { import = "plugins" },
    require("plugins.onedark"),
    require("plugins.plenary"),
    require("plugins.icon"),
    require("plugins.mason"),
    require("plugins.treesitter"),
    require("plugins.cmp"),
    require("plugins.editor"),
    require("plugins.ui"),
    require("plugins.dap"),
    require("plugins.markdown"),
    require("plugins.telescope"),
    require("plugins.git"),
    require("plugins.python"),
    require("plugins.latex"),
    -- require("plugins.remote"),
})
