return {
    "nvim-telescope/telescope.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons",
        "nvim-telescope/telescope-file-browser.nvim", -- Asegúrate de incluir esta extensión
    },
    lazy = false,
    config = function()
        require("telescope").setup({
            defaults = {
                sorting_strategy = "ascending", -- Ordenar los resultados de arriba hacia abajo
                layout_config = {
                    prompt_position = "top", -- Poner la barra de búsqueda arriba
                    preview_width = 0.5, -- Ajustar tamaño de la vista previa
                },
                file_ignore_patterns = { "node_modules", ".git", "dist", "build", "__pycache__" }, -- Excluir carpetas innecesarias
            },
            extensions = {
                file_browser = {
                    hijack_netrw = true, -- Reemplazar Netrw con Telescope
                }
            }
        })
        require("telescope").load_extension("file_browser")

        -- 🔎 **Atajos de teclado optimizados**
        vim.keymap.set("n", "<C-p>", ":Telescope find_files<CR>", { desc = "Buscar archivos en el proyecto" })
        vim.keymap.set("n", "<C-b>", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "Buscar dentro del archivo actual" })
        vim.keymap.set("n", "<C-S-b>", ":Telescope file_browser<CR>", { desc = "Abrir el explorador de archivos" })
        vim.keymap.set("n", "<C-S-f>", ":Telescope live_grep<CR>", { desc = "Buscar texto en todo el proyecto" })
    end
}
