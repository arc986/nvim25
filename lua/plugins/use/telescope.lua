return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  lazy = false,
  config = function()
    local fb_actions = require("telescope").extensions.file_browser.actions

    require("telescope").setup({
      defaults = {
        sorting_strategy = "ascending",
        layout_config = {
          prompt_position = "top",
          preview_width = 0.5,
        },
        file_ignore_patterns = { "node_modules", "^.*/%.git/", "^%.git/", "dist", "build", "__pycache__" },
      },
      extensions = {
        file_browser = {
          hijack_netrw = true,
          mappings = {
            ["i"] = {
              ["<C-n>"] = fb_actions.create,
            },
            ["n"] = {
              ["n"] = fb_actions.create,
              ["r"] = fb_actions.rename,
              -- ["d"] = fb_actions.remove,
              ["h"] = fb_actions.goto_parent_dir,
              ["l"] = require("telescope.actions").select_default, -- Cambiado
            },
          },
        },
      },
    })

    require("telescope").load_extension("file_browser")

    vim.keymap.set("n", "<C-P>", ":Telescope find_files<CR>", { desc = "Buscar archivos en el proyecto" })
    vim.keymap.set("n", "<C-O>", ":Telescope current_buffer_fuzzy_find<CR>", { desc = "Buscar dentro del archivo actual" })
    vim.keymap.set("n", "<C-B>", ":Telescope file_browser<CR>", { desc = "Abrir el explorador de archivos" })
    vim.keymap.set("n", "<C-F>", ":Telescope live_grep<CR>", { desc = "Buscar texto en todo el proyecto" })
  end,
}
