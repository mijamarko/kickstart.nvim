-- You can add your own plugins here or in other files in this directory!
--  I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
		{
			'windwp/nvim-autopairs',
			config = function()
				require('nvim-autopairs').setup {}
			end
		}, {
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
		wants = { 'nvim-treesitter' },
		after = { 'nvim-cmp' }
	},
		{
			'NvChad/nvim-colorizer.lua',
			config = function()
				require('colorizer').setup {
					filetypes = {
						'css',
						'javascript',
						'typescript',
						html = {
							mode = 'foreground',
						}
					},
				}
			end
		}
	},
	{
		'ThePrimeagen/refactoring.nvim',
		config = function()
			require('refactoring').setup {
				prompt_func_return_type = {
					go = true
				},
				prompt_func_param_type = {
					go = true
				},
			}
		end,
		dependencies = {
			'nvim-lua/plenary.nvim',
			'nvim-treesitter/nvim-treesitter'
		},
	}
