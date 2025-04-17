return {
  "catppuccin/nvim",
  name = "catppuccin",
  config = function()
    require("catppuccin").setup({
      flavour = "mocha",  -- Opciones: "latte", "frappe", "macchiato", "mocha"
      transparent_background = false,  -- Puedes ajustar si prefieres fondo transparente
      term_colors = true,
    })
    vim.cmd.colorscheme("catppuccin")
  end,
}
