return {
  "numToStr/Comment.nvim",
  lazy = true,
  keys = {
    { "<C-k>", mode = { "n", "v" } }, -- Carga el plugin al usar estas teclas
  },
  config = function()
    -- Configuración mínima de Comment.nvim
    require("Comment").setup()

    -- Mapeo para modo normal: comenta/descomenta la línea en la que se encuentra el cursor.
    vim.keymap.set("n", "<C-k>", "<Plug>(comment_toggle_linewise_current)", { desc = "Toggle comment" })

    -- Mapeo para modo visual: comenta/descomenta todas las líneas seleccionadas.
    vim.keymap.set("v", "<C-k>", "<Plug>(comment_toggle_linewise_visual)", { desc = "Toggle comment" })
  end,
}
