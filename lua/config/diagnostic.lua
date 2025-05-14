local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }

vim.diagnostic.config({
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = symbols.Error,
            [vim.diagnostic.severity.WARN] = symbols.Warn,
            [vim.diagnostic.severity.HINT] = symbols.Hint,
            [vim.diagnostic.severity.INFO] = symbols.Info
        },
    }
})
