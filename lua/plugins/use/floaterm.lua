return {
  "voldikss/vim-floaterm",
  lazy = false,
  config = function()
    -- Configuración global de Floaterm
    vim.g.floaterm_width = 0.8
    vim.g.floaterm_height = 0.8
    vim.g.floaterm_position = "center"
    vim.g.floaterm_title = "Terminal [$1/$2]"
    vim.g.floaterm_borderchars = "─│─│╭╮╯╰"

    -- Atajos personalizados
    vim.keymap.set("n", "<C-T>", ":FloatermToggle<CR>", { desc = "Mostrar/ocultar terminal flotante", noremap = true, silent = true })
    vim.keymap.set("n", "<Leader>tn", ":FloatermNew<CR>", { desc = "Nueva terminal flotante", noremap = true, silent = true })
    vim.keymap.set("n", "<Leader>tk", ":FloatermKill<CR>", { desc = "Cerrar terminal flotante", noremap = true, silent = true })
    vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Salir del modo terminal", noremap = true })
  end,
}
