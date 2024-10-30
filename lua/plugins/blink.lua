return {
    'saghen/blink.cmp',
    enabled = false,
    lazy = false, -- lazy loading handled internally
    dependencies = 'rafamadriz/friendly-snippets',
    version = 'v0.*',
    opts = {
        keymap = {
            ['<C-e>'] = { 'show', 'show_documentation' },
            ['<CR>'] = { 'accept' },
            ['<C-p>'] = { 'select_prev' },
            ['<C-n>'] = { 'select_next' },
            ['<C-f>'] = { 'scroll_documentation_up' },
            ['<C-b>'] = { 'scroll_documentation_down' }
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
                border = 'single',
                auto_show = true
            },
            ghost_text = {
                enabled = true,
            },
        }
    }
}
