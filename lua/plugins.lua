return {
  { 'lewis6991/gitsigns.nvim' },
  {
    'tpope/vim-unimpaired',
  },
  {
    'iamcco/markdown-preview.nvim',
  },
  {
    'fladson/vim-kitty',
  },
  {
    'mfussenegger/nvim-dap',
    -- NOTE: And you can specify dependencies as well
    dependencies = {
      -- Creates a beautiful debugger UI
      'rcarriga/nvim-dap-ui',

      -- Installs the debug adapters for you
      'williamboman/mason.nvim',
      'jay-babu/mason-nvim-dap.nvim',

      -- Add your own debuggers here
      'leoluz/nvim-dap-go',
    },
  },
}
