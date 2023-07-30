vim.o.guifont = "JetBrainsMonoNL Nerd Font:h20" -- text below applies for VimScript
vim.opt.linespace = 1
-- Helper function for transparency formatting
local alpha = function()
  return string.format("%x", math.floor(255 * vim.g.transparency or 0.8))
end
-- g:neovide_transparency should be 0 if you want to unify transparency of content and title bar.
vim.g.neovide_transparency = 0.0
vim.g.transparency = 1
vim.g.neovide_background_color = "#24283b" .. alpha()

vim.g.neovide_scroll_animation_length = 0.1
vim.g.neovide_refresh_rate = 60

vim.g.neovide_cursor_animation_length = 0.05




