-- load defaults i.e lua_lsp
require("nvchad.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- List server
local servers = { "emmet_language_server", "ts_ls", "html", "cssls", "omnisharp", "jsonls", "pylsp" }

local nvlsp = require "nvchad.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end
