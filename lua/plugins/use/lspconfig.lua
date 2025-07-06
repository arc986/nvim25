return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp", -- Para el autocompletado mejorado
    },
    config = function()
        -- Inicializar Mason
        require("mason").setup()

        -- Inicializar mason-lspconfig con los servidores deseados
        require("mason-lspconfig").setup({
            ensure_installed = { "pyright", "rust_analyzer", "lua_ls"  }, -- Lista de servidores a instalar
            automatic_installation = true,
        })

        -- Configurar los servidores LSP
        local lspconfig = require("lspconfig")
        local capabilities = require("cmp_nvim_lsp").default_capabilities() -- Habilita el autocompletado

        -- Lista de servidores a configurar
        local servers = { "pyright", "rust_analyzer", "lua_ls" }

        for _, server in ipairs(servers) do
            lspconfig[server].setup({
                capabilities = capabilities,
                on_attach = function(_, bufnr)
                    local opts = { noremap = true, silent = true, buffer = bufnr }
                    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)       -- Ir a definición
                    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)             -- Mostrar ayuda
                    vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)   -- Renombrar símbolo
                    vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- Acción de código
                end,
            })
        end
    end,
}
