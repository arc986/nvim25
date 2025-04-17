return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "dracula",               -- Puedes cambiar a "tokyonight", "gruvbox", etc.
        component_separators = { left = "", right = "" },
        section_separators   = { left = "", right = "" },
        globalstatus = true,             -- Hace que lualine ocupe toda la anchura de la ventana
        disabled_filetypes = {},         -- Puedes deshabilitar lualine en ciertos tipos de archivos
      },
      sections = {
        -- Sección A: Muestra el modo de Neovim. Se muestra sólo la primera letra para mayor minimalismo.
        lualine_a = { {
          "mode",
          fmt = function(str)
            return str:sub(1,1)
          end,
          color = { gui = "bold" },
        } },
        -- Sección B: Muestra la rama de Git y las diferencias (añadidos, modificados, etc.)
        lualine_b = { "branch", "diff" },
        -- Sección C: Muestra el nombre del archivo con su ruta relativa y estado (modificado, readonly, etc.)
        lualine_c = { {
          "filename",
          file_status = true,   -- Muestra si el archivo está modificado
          path = 1,             -- 0: solo nombre, 1: ruta relativa, 2: ruta absoluta.
        } },
        -- Sección X: Información de la codificación, formato y tipo de archivo
        lualine_x = { "encoding", "fileformat", "filetype" },
        -- Sección Y: Progreso del archivo (porcentaje)
        lualine_y = { "progress" },
        -- Sección Z: Ubicación actual (línea y columna)
        lualine_z = { "location" },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {}
      },
      tabline = {},
      extensions = {}
    })
  end,
}
