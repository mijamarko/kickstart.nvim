return {
    {
        'abecodes/tabout.nvim',
        config = function()
            require('tabout').setup {
                tabkey = '<Tab>',
                act_as_tab = true,
                completion = true,
                tabouts = {
                    { open = '"', close = '"' },
                    { open = "'", close = "'" },
                    { open = '`', close = '`' },
                    { open = '(', close = ')' },
                    { open = '[', close = ']' },
                    { open = '{', close = '}' }
                },
                ignore_beginning = true
            }
        end,
        dependencies = {
            'nvim-treesitter',
            'nvim-cmp'
        },
    }
}
