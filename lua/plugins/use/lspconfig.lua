return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        -- Configurar Mason
        require("mason").setup()
        require("mason-lspconfig").setup({
            automatic_installation = true, -- Instala servidores LSP automáticamente
        })

        -- Configurar los servidores LSP
        local lspconfig = require("lspconfig")
        local servers = { "pyright", "rust_analyzer", "lua_ls", "ts_ls" } -- Se reemplaza tsserver por ts_ls

        for _, server in ipairs(servers) do
            lspconfig[server].setup({
                capabilities = require("cmp_nvim_lsp").default_capabilities(), -- Habilita autocompletado avanzado
                on_attach = function(client, bufnr)
                    local opts = { noremap = true, silent = true, buffer = bufnr }
                    vim.keymap.set("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)  -- Ir a la definición
                    vim.keymap.set("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)        -- Mostrar documentación
                    vim.keymap.set("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts) -- Renombrar símbolo
                    vim.keymap.set("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts) -- Ejecutar acción de código
                end,
            })
        end
    end,
}
