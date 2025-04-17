return {
  "mg979/vim-visual-multi",
  lazy = false,
  keys = {
    { "<C-n>", "<Plug>(VisualMulti_NextMatch)", mode = { "n", "x" }, desc = "Ir a la siguiente coincidencia" },
    { "<C-p>", "<Plug>(VisualMulti_PrevMatch)", mode = { "n", "x" }, desc = "Ir a la coincidencia anterior" },
  },
}
