return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" }, -- Dependencia requerida
    config = function()
        vim.o.foldcolumn = "1" -- Mostrar columna de plegado
        vim.o.foldlevel = 99   -- Nivel inicial de plegado
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true -- Habilitar el plegado

        require("ufo").setup({
            provider_selector = function(bufnr, filetype, buftype)
                return { "treesitter", "indent" }
            end,
        })
    end,
}
