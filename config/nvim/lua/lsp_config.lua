local cmp = require('cmp')
local lspconfig = require('lspconfig');
local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities();
local lspkind = require('lspkind')
local masonregistry = require('mason-registry');

local mason_all = {};
local mason_ls = {"lua-language-server",  "jdtls"};
local mason_non_ls = {"java-debug-adapter", "java-test"};

vim.list_extend(mason_all, mason_ls);
vim.list_extend(mason_all, mason_non_ls);

require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})


for idx, pkg in pairs(mason_all) do
	if masonregistry.is_installed(pkg) == false then
		vim.cmd(string.format("MasonInstall %s", pkg));
	end
end

require("mason-lspconfig").setup {
    automatic_installation = true
}

lspconfig.lua_ls.setup {
	capabilities = lsp_capabilities
}


cmp.setup {
	sources = {
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lsp_signature_help' },
		{ name = 'vsnip' }
	},
	snippet = {
		expand = function(args)
			vim.fn["vsnip#anonymous"](args.body) -- because we are using the vsnip cmp plugin
		end,
	},
	formatting = {
		format = lspkind.cmp_format({
			mode = 'symbol_text',
			maxwidth = 50,
			ellipsis_char = '...',
			before = function (_, vim_item)
				return vim_item
			end
		})
	},
	mapping = cmp.mapping.preset.insert({
		['<C-d>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<CR>'] = cmp.mapping.confirm {
			behavior = cmp.ConfirmBehavior.Replace,
			select = true,
		},
		['<Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			else
				fallback()
			end
		end, { 'i', 's' }),
		['<S-Tab>'] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_prev_item()
			else
				fallback()
			end
		end, { 'i', 's' }),
	}),
}


