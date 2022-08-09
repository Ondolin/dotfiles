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

lspconfig.vuels.setup{
    capabilities = capabilities
}

lspconfig.tailwindcss.setup{
    capabilities = capabilities
}

require("grammar-guard").init()
lspconfig.grammar_guard.setup({
    cmd = { '/usr/local/bin/ltex-ls' },
      settings = {
          ltex = {
              enabled = { "latex", "tex", "bib", "markdown" },
              language = "en",
              diagnosticSeverity = "information",
              setenceCacheSize = 2000,
              additionalRules = {
                  enablePickyRules = true,
                  motherTongue = "en",
              },
              trace = { server = "verbose" },
              dictionary = {},
              disabledRules = {},
              hiddenFalsePositives = {},
          },
      },
  })

lspconfig.tsserver.setup{
    capabilities = capabilities
}

lspconfig.sumneko_lua.setup{}

lspconfig.taplo.setup{
    capabilities = capabilities
}

lspconfig.jsonls.setup {
  capabilities = capabilities,
}

lspconfig.dockerls.setup{
    capabilities = capabilities
}

lspconfig.bashls.setup{
    capabilities = capabilities
}

lspconfig.dartls.setup{
    capabilities = capabilities
}
