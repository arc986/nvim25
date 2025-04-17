return {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    lazy = false,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { 
                "python", "rust", "lua", "vim", "javascript", "html", "css", "json", "markdown", 
                "go", "c", "cpp", "typescript", "scss"  -- Lenguajes validados
            },
            sync_install = false,      -- Instala lenguajes de forma asíncrona
            auto_install = true,       -- Instala parsers automáticamente al abrir archivos
            highlight = {
                enable = true,         -- Habilitar resaltado avanzado de sintaxis
                additional_vim_regex_highlighting = false, -- Evita conflictos con regex tradicional
            },
            indent = { enable = true }, -- Configurar indentación basada en AST
            autopairs = { enable = true }, -- Activar nvim-autopairs integrado
            rainbow = {
                enable = true, -- Activar colores para paréntesis/corchetes
                extended_mode = true, -- Aplicar también colores a etiquetas como HTML
                max_file_lines = nil, -- Sin límite de líneas
                colors = {
                    "#ff5555", "#50fa7b", "#8be9fd", "#ffb86c", "#bd93f9", "#ff79c6", "#f1fa8c",
                }, -- Paleta de colores del tema Dracula
                termcolors = {
                    "Red", "Green", "Cyan", "Orange", "Magenta", "Pink", "Yellow",
                },
            },
            context_commentstring = {
                enable = true,        -- Configurar comentarios adaptativos según el contexto
                enable_autocmd = false, -- Control manual sobre los comentarios
            },
            playground = {
                enable = true,        -- Visualización interactiva del árbol AST
                updatetime = 25,      -- Tiempo de actualización
                persist_queries = false, -- Deshabilitar persistencia entre sesiones
            },
            fold = {
                enable = true,        -- Habilitar plegado de código basado en AST
            },
            textobjects = {
                select = {
                    enable = true,
                    lookahead = true, -- Avanzar automáticamente al siguiente objeto
                    keymaps = {
                        ["af"] = "@function.outer", -- Seleccionar toda la función
                        ["if"] = "@function.inner", -- Seleccionar el interior de la función
                        ["ac"] = "@class.outer",    -- Seleccionar toda la clase
                        ["ic"] = "@class.inner",    -- Seleccionar el interior de la clase
                    },
                },
                move = {
                    enable = true,
                    set_jumps = true, -- Agregar movimientos al registro de saltos
                    keymaps = {
                        ["<leader>a"] = "@parameter.inner", -- Mover al siguiente parámetro
                        ["<leader>b"] = "@function.outer", -- Mover al siguiente bloque
                    },
                },
            },
        })
    end
}
