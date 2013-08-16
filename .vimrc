filetype plugin on
set number
set incsearch
set hlsearch
set ignorecase
set smartcase

set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent

set laststatus=2
set statusline=%<%f%h%m%r\ %{&encoding}\ \ \ %l,%c\ \ \ %P\ \ \ %b

"выключить линейку
"set noruler

" CTRL-Tab is Next tab
nnoremap [1;2C :tabn<CR>

" CTRL-Shift-Tab is Previous tab
nnoremap [1;2D :tabp<CR>

" use Alt-Left and Alt-Right to move current tab to left or right
nnoremap <silent> [1;3D :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nnoremap <silent> [1;3C :execute 'silent! tabmove ' . tabpagenr()<CR>

" CTRL-F4 is :tabclose
nnoremap <C-F4> :tabclose<CR>
