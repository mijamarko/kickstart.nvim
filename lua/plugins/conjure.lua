return {
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
	},
	{
		'tpope/vim-surround'
	},
	{
		'guns/vim-sexp'
	},
	{
		'tpope/vim-sexp-mappings-for-regular-people'
	},
}
