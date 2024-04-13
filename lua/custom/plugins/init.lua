-- You can add your own plugins here or in other files in this directory!
-- I promise not to create any merge conflicts in this directory :)
--
-- See the kickstart.nvim README for more information
return {
	{
		'willothy/moveline.nvim',
		build = 'make',
	},
	{
		'windwp/nvim-autopairs',
		event = "InsertEnter",
		opts = {
			enable_check_bracket_line = false
		}
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
	},
	{
		'nvim-telescope/telescope-file-browser.nvim',
		dependencies = {
			'nvim-telescope/telescope.nvim',
			'nvim-lua/plenary.nvim'
		}
	},
	{
		'nvim-telescope/telescope-ui-select.nvim' },
	{
		'nvim-tree/nvim-web-devicons'
	},
	--CLOJURE/LISP SPECIFIC, I THINK, SOMEBODY HELP ME
	{
		'tpope/vim-surround'
	},
	{
		'guns/vim-sexp'
	},
	{
		'tpope/vim-sexp-mappings-for-regular-people'
	},
	{
		'tpope/vim-unimpaired'
	},
	{
		'onsails/lspkind.nvim'
	},
	{
		'folke/zen-mode.nvim'
	},
	{
		"iamcco/markdown-preview.nvim",
		cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
		ft = { "markdown" },
		build = function() vim.fn["mkdp#util#install"]() end,
	},
	{
		'nvim-treesitter/nvim-treesitter-context'
	},
	{
		'hiphish/rainbow-delimiters.nvim'
	},
	{
		'karb94/neoscroll.nvim',
		config = function()
			require('neoscroll').setup {}
		end
	},
	{
		'fladson/vim-kitty'
	},
	{
		'ggandor/leap.nvim',
		config = function()
			require('leap').add_default_mappings()
		end
	},
	{
		"Olical/conjure",
		ft = { "clojure" },
		dependencies = {
			{
				"PaterJason/cmp-conjure",
				config = function()
					local cmp = require("cmp")
					local config = cmp.get_config()
					table.insert(config.sources, {
						name = "buffer",
						option = {
							sources = {
								{ name = "conjure" },
							},
						},
					})
					cmp.setup(config)
				end,
			},
		},
		config = function(_, opts)
			require("conjure.main").main()
			require("conjure.mapping")["on-filetype"]()
		end,
		init = function()
			vim.g["conjure#debug"] = false
		end
	},
	{
		'tpope/vim-dispatch'
	},
	{
		'clojure-vim/vim-jack-in'
	},
	{
		'radenling/vim-dispatch-neovim'
	}
}
