return {
	{
	    'nvim-telescope/telescope.nvim', tag = '0.1.6',
	    dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{
	    "williamboman/mason.nvim",
	    "williamboman/mason-lspconfig.nvim",
	    "neovim/nvim-lspconfig",
	},
	{
		'nvim-treesitter/nvim-treesitter',
		run = ':TSUpdate'
	}

}

