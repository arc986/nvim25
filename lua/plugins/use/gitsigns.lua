return {
    "lewis6991/gitsigns.nvim",
    config = function()
        require("gitsigns").setup({
            signs = {
                add = { text = "│" },
                change = { text = "│" },
                delete = { text = "_" },
            },
            numhl = true, -- Resalta números de línea con cambios
            current_line_blame = true, -- Muestra información de `git blame`
        })
    end,
}
