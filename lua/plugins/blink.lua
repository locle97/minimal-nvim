return {
    'saghen/blink.cmp',
    enabled = true,
    lazy = false, -- lazy loading handled internally
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
        keymap = {
            show = '<C-e>',
            show_documentation = '<C-e>',
            hide_documentation = '<C-e>',
            accept = '<CR>',
            select_prev = "<C-p>",
            select_next = "<C-n>",
            scroll_documentation_up = "<C-f>",
            scroll_documentation_down = "<C-b>",
        },

        highlight = {
            use_nvim_cmp_as_default = true,
        },
        nerd_font_variant = 'normal',

        accept = { auto_brackets = { enabled = true } },

        trigger = {
            signature_help = {
                enabled = true
            }
        },

        windows = {
            autocomplete = {
                border = 'single',
                selection = 'manual',
                draw = 'reversed'
            },
            signature_help = {
                border = 'single'
            },
            documentation = {
                border = 'single'
            },
            ghost_text = {
                enabled = true,
            },
        }
    }
}
