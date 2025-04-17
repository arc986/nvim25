return {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    lazy = true,
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = { "python", "rust", "lua", "vim" },
            highlight = { enable = true },
        })
    end
}
