return {
  "nvim-lualine/lualine.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        icons_enabled = true,
        theme = "dracula",              -- Cambia "dracula" si usas otro tema
        component_separators = { left = "", right = "" },
        section_separators   = { left = "", right = "" },
        globalstatus = true,
        disabled_filetypes = {},
      },
      sections = {
        -- Muestra el modo de Neovim (minimalista, solo una letra)
        lualine_a = { {
          "mode",
          fmt = function(str) return str:sub(1,1) end,
          color = { gui = "bold" },
        } },
        -- Muestra la rama de Git y diferencias (added, modified, removed)
        lualine_b = { "branch", "diff" },
        -- Muestra el nombre del archivo, su estado y tipo
        lualine_c = { {
          "filename",
          file_status = true, -- Indica si el archivo está modificado o en modo solo lectura
          path = 1,           -- 0: solo nombre, 1: ruta relativa, 2: ruta absoluta
        }, {
          "filesize",         -- Tamaño del archivo en KB/MB
          fmt = function(size) return size and size .. "B" or "-" end, -- Formatea el tamaño
        } },
        -- Muestra la codificación, formato de archivo (unix, dos, etc.) y tipo de archivo
        lualine_x = { "encoding", "fileformat", "filetype" },
        -- Progreso (porcentaje) y líneas totales
        lualine_y = { {
          "progress",        -- Progreso en el archivo
          fmt = function(progress) return "Prog: " .. progress end,
        }, {
          function()         -- Función personalizada para mostrar líneas totales
            return "Líneas: " .. vim.api.nvim_buf_line_count(0)
          end,
        } },
        -- Línea y columna actuales
        lualine_z = { {
          "location",        -- Ubicación (línea y columna)
          fmt = function(loc) return "Ln,Col: " .. loc end,
        } },
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
