local status_ok, _ = pcall(require, "lspconfig")
if not status_ok then
  vim.notify('qwq')
	return
end

require("lsp.lsp-installer")
require("lsp.handlers").setup()
-- require("user.lsp.null-ls")
-- require("user.lsp.lsp-utils")
