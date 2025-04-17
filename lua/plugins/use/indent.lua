return {
    "echasnovski/mini.indentscope",
    version = false, -- Usa siempre la última versión
    config = function()
        require("mini.indentscope").setup({
            symbol = "│", -- Caracter básico de indentación
            draw = {
                delay = 100, -- Reducir el retraso para que las guías aparezcan rápido
                animation = function() return 0 end, -- Desactiva animaciones devolviendo un valor nulo
            },
            options = {
                try_as_border = true, -- Detectar bordes correctamente
            },
        })
    end,
}
