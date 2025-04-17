return {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    config = function()
        -- Definir los colores antes de configurar el plugin
        vim.cmd([[
            highlight IndentBlanklineChar guifg=#6272a4 gui=nocombine
            highlight IndentBlanklineContextChar guifg=#bd93f9 gui=nocombine
        ]])

        -- Configurar indent-blankline.nvim
        require("ibl").setup({
            indent = {
                char = "┊", -- Caracter de indentación
                highlight = "IndentBlanklineChar", -- Grupo de resaltado
            },
            scope = {
                enabled = false, -- Activar resaltado de bloques
                show_start = true,
                show_end = true,
                highlight = "IndentBlanklineContextChar", -- Grupo para resaltar el contexto
            },
            exclude = {
                filetypes = { "help", "dashboard", "alpha", "packer", "NvimTree", "Trouble" },
                buftypes = { "terminal" },
            },
        })
    end,
}
