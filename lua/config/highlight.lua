vim.cmd([[
highlight LineNr guibg=reverse guifg=SlateBlue
highlight CursorLineNr guifg=Cyan
highlight CursorLine guibg=#252525
highlight SignColumn guibg=reverse
highlight Cursor guibg=White
highlight BufferCurrent guibg=reverse
" highlight! VertSplit ctermfg=NONE
" highlight! VertSplit ctermbg=NONE
highlight NormalFloat guibg=reverse
highlight Pmenu guibg=reverse 
highlight PmenuSel guibg=SlateBlue
highlight TreesitterContext guibg=Dark
highlight StatusLine guibg=reverse
highlight StatusLineNC guibg=White
highlight Normal guibg = reverse"#22272e
highlight Tabline guibg = reverse
highlight NormalNC guibg = reverse
highlight WinSeparator guibg = reverse
" set fillchars=vert:┃
hi ActiveWindow guibg=reverse
hi InactiveWindow guibg=#1f2331
augroup WindowManagement
  autocmd!
  autocmd WinEnter * call Handle_Win_Enter()
augroup END
" Change highlight group of active/inactive windows
function! Handle_Win_Enter()
  setlocal winhighlight=Normal:ActiveWindow,NormalNC:InactiveWindow
endfunction

"let g:tagbar_ctags_bin = '/opt/homebrew/bin/ctags'
"let g:python3_host_prog = '/opt/homebrew/Cellar/python@3.9/3.9.7/bin/python3.9'
" hi ActiveWindow guibg=#252525                                                                                           
let python3_host_prog='/opt/homebrew/Cellar/python@3.10/3.10.12/Frameworks/Python.framework/Versions/3.10/bin/python3.10'
]])



------- cmp-highlight
vim.cmd([[
            highlight! CmpItemAbbrDeprecated guibg=blue gui=strikethrough guifg=#808080
            " blue
            highlight! CmpItemAbbrMatch guibg=NONE guifg=#e6cf71"#e06c75"#569CD6
            highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#c678dd
            " light blue
            highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE
            highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE
            highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE
            " pink
            highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0
            highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0
            " front
            highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4
            highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4
            highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4
            highlight MsgArea guifg=reverse guibg=reverse 
            ]])




--- indent-highlight
vim.cmd [[highlight IndentBlanklineIndent1 guifg=#30465d guibg=#14262b gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent2 guifg=#30465d guibg=#09262e gui=nocombine]]
vim.cmd [[highlight IndentBlanklineIndent3 guifg=#30465d guibg=#161e37 gui=nocombine]]
