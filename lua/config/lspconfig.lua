-- load defaults i.e lua_lsp
require("nvchad.lspconfig").defaults()

local lspconfig = require("lspconfig")

-- List server
local servers = { "emmet_language_server", "ts_ls", "html", "cssls", "jsonls", "pylsp" }

local nvlsp = require "nvchad.lspconfig"

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_attach = nvlsp.on_attach,
        on_init = nvlsp.on_init,
        capabilities = nvlsp.capabilities,
    }
end

local pid = vim.fn.getpid()
local util = require "lspconfig/util"

lspconfig.omnisharp.setup {
    on_attach = nvlsp.on_attach,
    capabilities = nvlsp.capabilities,
    on_init = nvlsp.on_init,
    handlers = nvlsp.handlers,
    cmd = {
        "omnisharp",
        "--languageserver",
        "--hostPID",
        tostring(pid),
    },
    root_dir = util.root_pattern("*.sln", "*.csproj"),
}
