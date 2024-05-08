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
	},
	{
		'mfussenegger/nvim-jdtls',
		dependencies = {
			'hrsh7th/nvim-cmp',
			'hrsh7th/cmp-nvim-lsp',
			'hrsh7th/cmp-vsnip',
			'hrsh7th/vim-vsnip',
			'onsails/lspkind.nvim',
			'ryanoasis/vim-devicons',
			'mfussenegger/nvim-dap'
		}
	}
}

