return {
    "akinsho/bufferline.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        require("bufferline").setup({
            options = {
                mode = "buffers",
                numbers = "none",
                indicator = { icon = "▎", style = "icon" },
                modified_icon = "●",
                close_icon = "",
                buffer_close_icon = "",
                left_mouse_command = "buffer %d",
                right_mouse_command = "bdelete! %d",
                separator_style = "thick",
                enforce_regular_tabs = true,
                always_show_bufferline = true,
                tab_size = 20,
                offsets = {
                    { filetype = "NvimTree", text = "", padding = 1 },
                },
            },
        })

        -- Saltar a buffers con Alt+Número sin generar mensajes de salida
        for i = 1, 9 do
            vim.keymap.set("n", "<A-" .. i .. ">", ":silent! BufferLineGoToBuffer " .. i .. "<CR>", { desc = "Ir al buffer " .. i })
        end

        -- Recorrer buffers con Alt+Flechas sin interrupciones en la terminal
        vim.keymap.set("n", "<A-Left>", ":silent! BufferLineCyclePrev<CR>", { desc = "Buffer anterior" })
        vim.keymap.set("n", "<A-Right>", ":silent! BufferLineCycleNext<CR>", { desc = "Buffer siguiente" })
    end,
}
