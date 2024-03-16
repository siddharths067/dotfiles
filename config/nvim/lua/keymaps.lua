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
			"<cmd>Telescope find_files<cr>", 'Find files'
		}
	},
	o = {
		name = 'Open',
		r = {
			"<cmd>Telescope oldfiles<cr>", 'Recent files'
		}
	}
}, {prefix="<leader>"})


