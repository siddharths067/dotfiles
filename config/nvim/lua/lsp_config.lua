require("mason").setup({
    ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
    }
})


require("mason-lspconfig").setup {
    ensure_installed = { "lua_ls", "rust_analyzer", "jdtls" },
    automatic_installation = true
}


local lspconfig = require('lspconfig')


lspconfig.lua_ls.setup{}
lspconfig.jdtls.setup{}


