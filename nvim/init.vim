call plug#begin("~/.vim/plugged")
  " Plugin Section
  Plug 'dracula/vim'
call plug#end()
"Config Section
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme dracula

set foldmethod=manual
set nofoldenable
set foldlevel=99

lua require('plugins')
lua require('options')
lua require('conf')
lua require('keymaps')
lua require('lsp')
