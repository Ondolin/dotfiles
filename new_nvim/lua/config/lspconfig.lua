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

require("grammar-guard").init()
lspconfig.grammar_guard.setup({
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

lspconfig.tsserver.setup{}