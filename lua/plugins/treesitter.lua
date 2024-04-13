return {
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
        },
        build = ':TSUpdate',
        config = vim.defer_fn(function ()
           require('nvim-treesitter.configs').setup {
               ensure_installed = {'go', 'lua', 'vim', 'bash', 'clojure', 'html', 'javascript', 'typescript'},
               auto_install = true,
               highlight = { enable = true },
               incremental_selection = {
                   enable = true,
                   keymaps = {
                       init_selection = '<c-space>',
                       node_incremental = '<c-space>',
                       scope_incremental = '<c-s>',
                       node_decremental = '<M-space>',
                   },
               },
               textobjects = {
                   select = {
                       enable = true,
                       lookahead = true,
                   },
                   move = {
                       enable = true,
                       set_jumps = true,
                       goto_next_start = {
                           [']m'] = '@function.outer',
                           [']]'] = '@class.outer',
                       },
                       goto_next_end = {
                           [']M'] = '@function.outer',
                           [']['] = '@class.outer',
                       },
                       goto_previous_start = {
                           ['[m'] = '@function.outer',
                           ['[['] = '@class.outer',
                       },
                       goto_previous_end = {
                           ['[M'] = '@function.outer',
                           ['[]'] = '@class.outer',
                       },
                   },
               },
           }
        end,0)
    },
    {
        'nvim-treesitter/nvim-treesitter-context',
    },
}
