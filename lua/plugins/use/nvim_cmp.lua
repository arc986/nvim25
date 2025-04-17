return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-nvim-lsp", -- Autocompletado basado en LSP
        "hrsh7th/cmp-buffer", -- Autocompletado basado en buffer
        "hrsh7th/cmp-path", -- Autocompletado de rutas
        "L3MON4D3/LuaSnip", -- Snippets
    },
    config = function()
        local cmp = require("cmp")
        cmp.setup({
            mapping = cmp.mapping.preset.insert({
                ["<Tab>"] = cmp.mapping.select_next_item(), -- Siguiente sugerencia
                ["<S-Tab>"] = cmp.mapping.select_prev_item(), -- Sugerencia anterior
                ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Confirmar selección
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" }, -- Autocompletado basado en LSP
                { name = "buffer" }, -- Basado en contenido del buffer actual
                { name = "path" }, -- Completa rutas de archivos
            }),
        })
    end,
}
