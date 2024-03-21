local wk = require("which-key")

wk.register({
	e = {
		name = 'Editor',
		t = {
			name = 'Theme',
			l = {"<cmd>lua vim.o.background='light'<cr>", 'set light background'},
			d = {"<cmd>lua vim.o.background='dark'<cr>", 'set dark background'},
			c = {"<cmd>Telescope colorscheme<cr>", 'Choose a theme'}
		}
	},
	f = {
		name = 'Find',
		f = {
			"<cmd>Telescope find_files<cr>", 'Files'
		},
		g = {
			"<cmd>Telescope live_grep<cr>", "Regex Pattern"
		},
		s = {
			"<cmd>Telescope lsp_document_symbols<cr>", "Symbols"
		},
		S = {
			"<cmd>Telescope lsp_workspace_symbols<cr>", "Symbols"
		}
	},
	g = {
		name = 'Go to',
		r = {
			"<cmd>Telescope lsp_references<cr>", 'References'
		},
		c = {
			"<cmd>Telescope lsp_incoming_calls<cr>", 'Incoming calls'
		},
		d = {
			"<cmd>Telescope lsp_definitions<cr>", 'Definitions'
		},
		D = {
			"<cmd>Telescope lsp_type_definitions<cr>", 'Type definitions'
		},
		i = {
			"<cmd>Telescope lsp_implementations<cr>", 'Implementations'
		}
	},
	o = {
		name = 'Open',
		r = {
			"<cmd>Telescope oldfiles<cr>", 'Recent files'
		}
	}
}, {prefix="<leader>"})


