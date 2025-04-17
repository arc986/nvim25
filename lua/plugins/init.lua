-- Verifica si Lazy.nvim está instalado, si no, lo clona automáticamente
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    print("⚡ Instalando Lazy.nvim...")
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Cargar automáticamente los plugins dentro de "use"
local plugins_path = vim.fn.stdpath("config") .. "/lua/plugins/use"
local plugins = {}

for _, file in ipairs(vim.fn.readdir(plugins_path)) do
    if file:match("%.lua$") then
        local plugin_name = file:gsub("%.lua$", "")

        local ok, plugin = pcall(require, "plugins.use." .. plugin_name)
        if ok then
            table.insert(plugins, plugin)
        else
            vim.notify("⚠️ Error al cargar plugin: " .. plugin_name, vim.log.levels.ERROR)
        end
    end
end

-- Configuración optimizada para Lazy.nvim
require("lazy").setup(plugins, {
    install = { missing = true },  -- Instala los plugins faltantes automáticamente
    ui = { border = "rounded" },   -- Mejora la interfaz gráfica de Lazy.nvim
    silent = true,                 -- Evita mensajes de instalación en la línea de comandos
})
