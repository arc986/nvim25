-- ## Configuración de atajos en Neovim ##

local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- **Búsqueda**
keymap('n', '<C-f>', 'g#', opts)                                -- Buscar la última coincidencia exacta
keymap('v', '<C-f>', '<Esc>#', opts)                            -- Buscar dentro de una selección visual

-- **Trabajar con terminales**
keymap('n', '<C-`>', ':split | terminal<CR>', opts)             -- Abrir terminal integrada

-- **Plegado de código**
keymap('n', '<Space>', 'za', opts)                              -- Alternar el plegado en la línea actual
keymap('n', '<C-Space>', 'zi', opts)                            -- Alternar todos los plegados

-- **Navegación entre pestañas y buffers**
keymap('n', '<Tab>', ':bn!<CR>', opts)                          -- Ir al siguiente buffer
-- keymap('n', '<C-b>', ':bn!<CR>', opts)                          -- Ir al siguiente buffer (alternativo)
-- keymap('i', '<C-b>', '<Esc>:bn!<CR>', opts)                     -- Cambiar buffer desde modo insertar
keymap('n', '<C-Tab>', ':bnext<CR>', opts)                      -- Cambiar al siguiente buffer
keymap('n', '<C-S-Tab>', ':bprev<CR>', opts)                    -- Cambiar al buffer anterior
keymap('n', '<C-x>', ':bd<CR>', opts)                           -- Cerrar buffer actual
keymap('i', '<C-x>', '<Esc>:bd<CR>', opts)                      -- Cerrar buffer desde insertar

-- **Guardado**
keymap('n', '<C-s>', ':w<CR>', opts)                            -- Guardar archivo actual
keymap('v', '<C-s>', '<Esc>:w<CR>', opts)                       -- Guardar desde modo visual
keymap('i', '<C-s>', '<Esc>:w<CR>', opts)                       -- Guardar desde modo insertar

-- **Deshacer y rehacer**
keymap('n', '<C-z>', 'u', opts)                                 -- Deshacer cambios
keymap('v', '<C-z>', '<Esc>u', opts)                            -- Deshacer en visual
keymap('i', '<C-z>', '<Esc>u', opts)                            -- Deshacer desde insertar
keymap('n', '<C-y>', '<C-r>', opts)                             -- Rehacer cambios
keymap('v', '<C-y>', '<Esc><C-r>', opts)                        -- Rehacer en visual
keymap('i', '<C-y>', '<Esc><C-r>', opts)                        -- Rehacer desde insertar

-- **Duplicar y seleccionar**
keymap('n', '<S-A-Up>', 'yyp', opts)                            -- Duplicar línea hacia abajo
keymap('n', '<S-A-Down>', 'yyP', opts)                          -- Duplicar línea hacia arriba
keymap('n', '<C-a>', 'ggVG', opts)                              -- Seleccionar todo el archivo

-- **Mover líneas**
keymap('n', '<C-Up>', ':m.-2<CR>==', opts)                      -- Mover línea hacia arriba
keymap('v', '<C-Up>', ":m '<-2<CR>gv=gv", opts)                 -- Mover selección hacia arriba
keymap('i', '<C-Up>', '<Esc>:m.-2<CR>==gi', opts)               -- Mover línea hacia arriba desde insertar
keymap('n', '<C-Down>', ':m.+1<CR>==', opts)                    -- Mover línea hacia abajo
keymap('v', '<C-Down>', ":m '>+1<CR>gv=gv", opts)               -- Mover selección hacia abajo
keymap('i', '<C-Down>', '<Esc>:m.+1<CR>==gi', opts)             -- Mover línea hacia abajo desde insertar

-- **Indentación**
keymap('v', '<Tab>', '>gv', opts)                               -- Indentar a la derecha en modo visual
keymap('v', '<S-Tab>', '<gv', opts)                             -- Indentar a la izquierda en modo visual

-- **Copiar y pegar**
keymap('n', '<C-c>', 'Y', opts)                                 -- Copiar línea actual
keymap('v', '<C-c>', 'y', opts)                                 -- Copiar selección
keymap('i', '<C-c>', '<Esc>Ygi', opts)                          -- Copiar desde modo insertar
keymap('n', '<C-v>', 'p', opts)                                 -- Pegar después del cursor
keymap('v', '<C-v>', 'p', opts)                                 -- Pegar después de selección
keymap('i', '<C-v>', '<Esc>pgi', opts)                          -- Pegar desde insertar

