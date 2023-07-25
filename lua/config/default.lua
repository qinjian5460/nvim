-- vim.cmd("colorscheme onedark")
vim.cmd([[
set fillchars+=vert:\   
syntax on "开启语法补全
set ignorecase
set incsearch
set so=5 "设置页面滑动为5行
set tabstop=4 "设置tab为4个空格
set softtabstop=4 "同上
set shiftwidth=4 "同上
set expandtab "同上
" let g:onedark_transparent_background = 0 " By default it is 0
" let g:onedark_style = 'deep'
set termguicolors
set background=dark
" highlight Normal guibg=NONE ctermbg=None
" 设置空白字符的视觉提示
set list listchars=extends:❯,precedes:❮,tab:▸\ ,trail:˽
" 高亮当前行
set cursorline
"set cursorcolumn
" 显示行号
set number
" Let clangd fully control code completion
"let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't get updates.
"let g:ycm_clangd_binary_path = exepath("clangd")
set foldenable      " 允许折叠  
set showcmd         " 输入的命令显示出来，看的清楚些
set autoindent
set cindent
set showmatch
" 鼠标
set mouse=a
"set selection=exclusive
set selectmode=mouse,key
set relativenumber
set hidden
set updatetime=100
set shortmess+=c
set ruler
set rulerformat=%15(%c%V\ %p%%%)
]])

