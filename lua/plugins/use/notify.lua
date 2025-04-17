return {
    "folke/noice.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" },
    lazy = false,
    config = function()
        require("noice").setup({
            presets = {
                bottom_search = true,
                command_palette = true,
                lsp_doc_border = true,
            },
            messages = {
                enabled = true,
                view = "notify", -- Usa Notify en lugar de la terminal de Noice
            },
            popupmenu = {
                enabled = false, -- Desactiva el menú flotante de Noice
            },
            routes = {
                {
                    filter = { event = "msg_show", find = "BufferLine" },
                    opts = { skip = true }, -- No mostrar mensajes de cambio de buffer
                },
                {
                    filter = { event = "msg_show", kind = "echo" },
                    opts = { skip = true }, -- Ignora mensajes generales en la línea de comandos
                },
                {
                    filter = { event = "msg_show", find = "lazyredraw" },
                    opts = { skip = true }, -- Oculta mensajes relacionados con redibujado
                },
            },
        })

        -- Configuración de Notify
        local notify = require("notify")
        notify.setup({
            timeout = 3000,
            stages = "fade",
            background_colour = "#1e1e2e",
        })

        -- Hacer que Notify sea el sistema de notificaciones por defecto en Neovim
        vim.notify = notify
    end,
}
