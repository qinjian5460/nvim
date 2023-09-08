vim.keymap.set("i", "<C-,><C-,>", "<><Esc>i", {noremap = true})
vim.keymap.set("n", "H", "^", {noremap = true})
vim.keymap.set("n", "L", "$", {noremap = true})
vim.keymap.set("v", "H", "^", {noremap = true})
vim.keymap.set("v", "L", "$", {noremap = true})
-- vim.keymap.set("n", "<leader>t", ":NvimTreeToggle<CR>:setlocal winhighlight=Normal:InactiveWindow<CR>", {noremap = true})
vim.keymap.set("n", "<leader>t", ":Neotree toggle<CR>:setlocal winhighlight=Normal:InactiveWindow<CR>", {noremap = true})
vim.keymap.set("n", "<leader>r", ":RnvimrToggle<CR>", {noremap = true})
vim.keymap.set("n", "<leader>c", ":Trouble document_diagnostics<CR>:setlocal winhighlight=Normal:ActiveWindow<CR>", {noremap = true})
vim.keymap.set("", "<up>", ":res +5<CR>", {noremap = true})
vim.keymap.set("", "<down>", ":res -5<CR>", {noremap = true})
vim.keymap.set("", "<left>", ":vertical resize-5<CR>", {noremap = true})
vim.keymap.set("", "<right>", ":vertical resize+5<CR>", {noremap = true})
vim.keymap.set("n", "<leader>k", ":set nosplitbelow<CR>:split<CR>:set splitbelow<CR>", {noremap = true})
vim.keymap.set("n", "<leader>j", ":set splitbelow<CR>:split<CR>", {noremap = true})
vim.keymap.set("n", "<leader>h", ":set nosplitright<CR>:vsplit<CR>:set splitright<CR>", {noremap = true})
vim.keymap.set("n", "<leader>l", ":set splitright<CR>:vsplit<CR>", {noremap = true})
vim.keymap.set("n", "<leader>p", ":Dashboard<CR>", {noremap = true})
-- vim.keymap.set("n", "<leader>b", ":set splitbelow<CR>:split<CR>:terminal<CR>", {noremap = true})
vim.keymap.set("n", "<leader>b", ":ToggleTerm<CR>", {noremap = true})
vim.keymap.set("n", "<leader>v", ":SymbolsOutline<CR>", {noremap = true})
-- vim.keymap.set("n", "<leader>3", ":Neotree toggle git_status<CR>", {noremap = true})
-- vim.keymap.set("n", "<leader>4", ":Neotree toggle buffers<CR>", {noremap = true})
vim.keymap.set("n", "<tab>k", ":bn<CR>", {noremap = true})
vim.keymap.set("n", "<tab>j", ":bp<CR>", {noremap = true})
vim.keymap.set("n", "<tab>d", ":BufferDelete<CR>", {noremap = true})
-- vim.keymap.set("", "<leader>sc", ":set spell<CR>", {noremap = true})
vim.keymap.set("n", "<leader>ie", ":lua vim.diagnostic.open_float(nil, {focus=false})<CR>", {noremap = true})
vim.keymap.set("n", "<leader>it", ":Lspsaga term_toggle<CR>", {noremap = true})
vim.keymap.set("n", "<C-CR>", ":Lspsaga show_line_diagnostics<CR>", {noremap = true})
vim.keymap.set("n", "<leader>id", ":Lspsaga peek_definition<CR>", {noremap = true})
vim.keymap.set("n", "<leader>dz", ":DapContinue<CR>", {noremap = true})
vim.keymap.set("n", "<leader>d=", ":DapToggleBreakpoint<CR>", {noremap = ture})
vim.keymap.set("n", "<leader>/f", ":Telescope fd theme=dropdown<CR>", { noremap = true })
vim.keymap.set("n", "<leader>/w", ":Telescope grep_string theme=dropdown<CR>", { noremap = true })
vim.keymap.set("n", "<leader>/p", ":Telescope projects<CR>", { noremap = true })
vim.keymap.set("n", "<leader>/t", ":Telescope live_grep theme=dropdown<CR>", { noremap = true })
vim.keymap.set("n", "<leader>gl", ":LazyGit<CR>", { noremap = true })
vim.keymap.set("n", "<leader>go", ":DiffviewOpen<CR>", { noremap = true })
vim.keymap.set("n", "<leader>gc", ":DiffviewClose<CR>", { noremap = true })
vim.cmd("tnoremap <silent> <C-n> <C-\\><C-n>")
-- vim.cmd([[
--     imap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
--     smap <expr> <Tab>   vsnip#jumpable(1)   ? '<Plug>(vsnip-jump-next)'      : '<Tab>'
--     imap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
--     smap <expr> <S-Tab> vsnip#jumpable(-1)  ? '<Plug>(vsnip-jump-prev)'      : '<S-Tab>'
-- ]])
