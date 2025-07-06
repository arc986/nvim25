-- Resaltado de sintaxis y colores básicos
vim.cmd('syntax enable')        -- Activa el resaltado de sintaxis
vim.opt.termguicolors = true    -- Soporte para colores de 24 bits (necesario para plugins como Lualine)

-- Configuración de codificación
vim.scriptencoding = 'utf-8'    -- Codificación para scripts
vim.opt.encoding = 'utf-8'      -- Establece la codificación del editor
vim.opt.fileencoding = 'utf-8'  -- Codificación para los archivos editados

-- Portapapeles
vim.opt.clipboard:append('unnamedplus')  -- Habilita copiar/pegar con el portapapeles del sistema

-- Comportamiento general del editor
vim.opt.compatible = false      -- Desactiva el modo compatible (antiguo vi)
vim.opt.wrap = false            -- No permite que las líneas largas se dividan
vim.opt.relativenumber = true   -- Muestra números de línea relativos
vim.opt.number = true           -- Muestra el número de línea absoluto
vim.opt.cursorline = true       -- Resalta la línea actual
vim.opt.joinspaces = false      -- Usa un solo espacio al unir líneas
vim.opt.showmode = false        -- Oculta el modo actual (INSERT, NORMAL, etc.)

-- Ahorro de energía y memoria
-- vim.opt.lazyredraw = true       -- Redibuja la pantalla solo cuando es necesario
vim.opt.updatetime = 1000       -- Aumenta el tiempo antes de activar eventos como el guardado
vim.opt.redrawtime = 1000       -- Ajusta el tiempo de redibujado

-- Opciones de respaldo
vim.opt.backup = false          -- Desactiva archivos de respaldo
vim.opt.writebackup = false     -- Desactiva respaldos temporales al escribir
vim.opt.swapfile = false        -- Desactiva archivos swap para ahorrar espacio y escritura

-- Configuración de indentación
vim.opt.smartindent = true      -- Indentación inteligente
vim.opt.smartcase = true        -- Ignora mayúsculas en búsquedas si no hay mayúsculas
vim.opt.expandtab = true        -- Convierte tabs en espacios
vim.opt.shiftwidth = 2          -- Espacios al identar
vim.opt.softtabstop = 2         -- Espacios al usar la tecla Tab
vim.opt.tabstop = 2             -- Visualiza tabulaciones como 4 espacios

-- Línea de comandos
vim.opt.cmdheight = 1           -- Altura de la línea de comandos

-- Rendimiento y comportamiento
vim.opt.shortmess:append('c')   -- Simplifica los mensajes en el área de comandos
vim.opt.hidden = true           -- Permite ocultar buffers sin guardar

-- Búsqueda
vim.opt.ignorecase = true       -- Ignora mayúsculas en búsquedas
vim.opt.smartcase = true        -- Respeta mayúsculas si se escriben en el patrón
vim.opt.incsearch = true        -- Realza coincidencias al escribir

-- Corrector ortográfico
vim.opt.spell = false           -- Desactiva corrección ortográfica (actívala si es necesario)
vim.opt.spelllang = {'en', 'es'}-- Idiomas para corrección si se activa


-- Plegado de código
vim.o.foldmethod = "syntax"     -- Por defecto, usa marcadores
vim.o.foldmarker = "#{,#}"      -- Define los delimitadores de marcadores
vim.opt.foldclose = 'all'       -- Cierra automáticamente pliegues no usados
vim.opt.foldlevel = 1           -- Despliega solo el primer nivel de plegado
vim.opt.foldnestmax = 3         -- Máximo 3 niveles de anidación
vim.opt.foldenable = true       -- Habilita el plegado de código

-- Otras configuraciones
vim.opt.autoread = true         -- Recarga automáticamente los archivos si son modificados externamente

vim.g.mapleader = " "

vim.opt.shortmess:append("I")
