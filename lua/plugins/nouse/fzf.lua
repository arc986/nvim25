return {
    "ibhagwan/fzf-lua",
    lazy = false,
    config = function()
        require("fzf-lua").setup({
            files = {
                fd_opts = "--type f --hidden --exclude .git --exclude node_modules --exclude dist --exclude build --exclude __pycache__"
            }
        })

        -- Buscar archivos en el proyecto con Ctrl+F
        vim.keymap.set("n", "<C-f>", function()
            require("fzf-lua").files()
        end, { desc = "Buscar archivos con Ctrl+F usando fzf-lua" })

        -- 🔹 Corrección: Ctrl+B ahora busca solo dentro del archivo actual
        vim.keymap.set("n", "<C-b>", function()
            require("fzf-lua").grep({
                search = vim.fn.input("🔎 Buscar en archivo actual: "),
                cmd = "rg --no-heading --smart-case", -- Usa ripgrep para buscar texto dentro del archivo
                files = { vim.fn.expand("%:p") }, -- Busca solo en el archivo actual
                silent = true, -- Oculta mensajes innecesarios
            })
        end, { desc = "Buscar dentro del archivo actual con Ctrl+B" })

    end
}
