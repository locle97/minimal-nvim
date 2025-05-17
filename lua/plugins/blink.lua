return {
    {
        'saghen/blink.cmp',
        dependencies = { 'rafamadriz/friendly-snippets' },
        version = '1.*',

        ---@module 'blink.cmp'
        ---@type blink.cmp.Config
        opts = {
            enabled = function ()
                local filetype = vim.bo.filetype
                return filetype ~= 'DressingInput'
            end,
            keymap = {
                preset = 'default',
                ['<C-y>'] = { 'show', 'show_documentation', 'hide_documentation' },
                ['<CR>'] = { 'select_and_accept', 'fallback' },
                ['<C-space>'] = {},
            },

            signature = { enabled = true, window = { border = 'single' } },

            appearance = {
                nerd_font_variant = 'mono'
            },

            completion = {
                documentation = { auto_show = true, auto_show_delay_ms = 0, window = { border = 'single' } },
                ghost_text = { enabled = false },
                menu = { border = 'single', draw = { columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } } } },
                accept = { auto_brackets = { enabled = true } },
            },

            sources = {
                default = { 'lsp', 'path', 'snippets', 'buffer', 'copilot' },
                providers = {
                    copilot = {
                        name = "copilot",
                        module = "blink-cmp-copilot",
                        score_offset = 100,
                        async = true,
                    },
                },
            },

            fuzzy = { implementation = "prefer_rust_with_warning" }
        },
        opts_extend = { "sources.default" }
    },
    {
        'saghen/blink.pairs',
        version = '*', -- (recommended) only required with prebuilt binaries

        -- download prebuilt binaries from github releases
        dependencies = 'saghen/blink.download',
        -- OR build from source
        build = 'cargo build --release',
        -- OR build from source with nix
        -- build = 'nix build .#build-plugin',

        --- @module 'blink.pairs'
        --- @type blink.pairs.Config
        opts = {
            mappings = {
                -- you can call require("blink.pairs.mappings").enable() and require("blink.pairs.mappings").disable() to enable/disable mappings at runtime
                enabled = true,
                -- see the defaults: https://github.com/Saghen/blink.pairs/blob/main/lua/blink/pairs/config/mappings.lua#L10
                pairs = {},
            },
            highlights = {
                enabled = true,
                groups = {
                    'BlinkPairsOrange',
                    'BlinkPairsPurple',
                    'BlinkPairsBlue',
                },
                matchparen = {
                    enabled = true,
                    group = 'MatchParen',
                },
            },
            debug = false,
        }
    }
}
