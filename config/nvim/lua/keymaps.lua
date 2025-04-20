local wk = require("which-key")


wk.add(
  {
    { "<leader>e", group = "Editor" },
    { "<leader>et", group = "Theme" },
    { "<leader>etc", "<cmd>Telescope colorscheme<cr>", desc = "Choose a theme" },
    { "<leader>etd", "<cmd>lua vim.o.background='dark'<cr>", desc = "set dark background" },
    { "<leader>etl", "<cmd>lua vim.o.background='light'<cr>", desc = "set light background" },
    { "<leader>f", group = "Find" },
    { "<leader>fD", "<cmd>Telescope lsp_type_definitions<cr>", desc = "Type definitions" },
    { "<leader>fS", "<cmd>Telescope lsp_workspace_symbols<cr>", desc = "Workspace Symbols" },
    { "<leader>fc", "<cmd>Telescope lsp_incoming_calls<cr>", desc = "Incoming calls" },
    { "<leader>fd", "<cmd>Telescope lsp_definitions<cr>", desc = "Definitions" },
    { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Files" },
    { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Regex Pattern" },
    { "<leader>fi", "<cmd>Telescope lsp_implementations<cr>", desc = "Implementations" },
    { "<leader>fr", "<cmd>Telescope lsp_references<cr>", desc = "References" },
    { "<leader>fs", "<cmd>Telescope lsp_document_symbols<cr>", desc = "Symbols" },
    { "<leader>o", group = "Open" },
    { "<leader>or", "<cmd>Telescope oldfiles<cr>", desc = "Recent files" },
  }
)
