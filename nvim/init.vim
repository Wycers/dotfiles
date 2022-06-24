"Config Section
if (has("termguicolors"))
 set termguicolors
endif
syntax enable

set foldmethod=manual
set nofoldenable
set foldlevel=99

lua require('plugins')
lua require('colorschema')
lua require('options')
lua require('conf')
lua require('keymaps')
lua require('lsp')
