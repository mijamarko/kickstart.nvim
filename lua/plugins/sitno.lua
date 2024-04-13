return {
  { 'folke/which-key.nvim',
  config = function()
    require('which-key').setup {}
  end
},
{ 'numToStr/Comment.nvim',
config = function()
  require('Comment').setup {}
end
  },
  { 'folke/zen-mode.nvim', config = function()
    require('zen-mode').setup {}
  end },
  { 'mbbill/undotree', config = function()
  end },
  { 'hiphish/rainbow-delimiters.nvim', config = function()
  end },
  { 'navarasu/onedark.nvim',
  config = function()
    require('onedark').load()
  end
},
{ 'tpope/vim-sleuth' },
{
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  opts = {
    enable_check_bracket_line = false
  }
},
{ 'lukas-reineke/indent-blankline.nvim',
  main = 'ibl',
  opts = {},
},
}
