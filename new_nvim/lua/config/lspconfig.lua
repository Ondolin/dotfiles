local lspconfig = require("lspconfig")
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

lspconfig.pyright.setup{
    capabilities = capabilities
}

lspconfig.texlab.setup{
    capabilities = capabilities
}

lspconfig.prolog_lsp.setup{
    capabilities = capabilities
}