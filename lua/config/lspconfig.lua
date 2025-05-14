-- load defaults i.e lua_lsp
local lspconfig = require("lspconfig")

-- disable semanticTokens
local on_init = function(client, _)
    if client.supports_method "textDocument/semanticTokens" then
        client.server_capabilities.semanticTokensProvider = nil
    end
end
-- List server
local servers = { "lua_ls", "emmet_language_server", "ts_ls", "html", "cssls", "jsonls", "pylsp", "angularls"}

-- lsps with default config
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
        on_init = on_init
    }
end

local pid = vim.fn.getpid()
local util = require "lspconfig/util"

lspconfig.omnisharp.setup {
    cmd = {
        "OmniSharp",
        "--languageserver",
        "--hostPID",
        tostring(pid),
    },
    on_init = on_init,
    settings = {
        FormattingOptions = {
            -- Enables support for reading code style, naming convention and analyzer
            -- settings from .editorconfig.
            EnableEditorConfigSupport = true,
            -- Specifies whether 'using' directives should be grouped and sorted during
            -- document formatting.
            OrganizeImports = true,
        },
        RoslynExtensionsOptions = {
            -- Enables support for roslyn analyzers, code fixes and rulesets.
            EnableAnalyzersSupport = false,
            -- Enables support for showing unimported types and unimported extension
            -- methods in completion lists. When committed, the appropriate using
            -- directive will be added at the top of the current file. This option can
            -- have a negative impact on initial completion responsiveness,
            -- particularly for the first few completion sessions after opening a
            -- solution.
            EnableImportCompletion = false,
            -- Only run analyzers against open files when 'enableRoslynAnalyzers' is
            -- true
            AnalyzeOpenDocumentsOnly = false,
        },
    },
    root_dir = util.root_pattern("*.sln", "*.csproj"),
}
