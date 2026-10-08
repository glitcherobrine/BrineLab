-- 1. Asegúrate de iniciar Mason
require("mason").setup()

-- 2. Asegúrate de iniciar mason-lspconfig
require("mason-lspconfig").setup({
  ensure_installed = { "clangd" }, -- Esto asegura que esté instalado
})

-- 3. Configura clangd mediante nvim-lspconfig
local lspconfig = require("lspconfig")

lspconfig.clangd.setup({
  cmd = {
    -- Mason maneja el path por detrás, así que "clangd" a secas funcionará
    "clangd",
    "--background-index",     -- Indexación rápida en segundo plano
    "--clang-tidy",           -- ¡ESTE ES EL IMPORTANTE! Activa las guías de estilo, seguridad y rendimiento
    "--header-insertion=iwyu" -- Te sugiere qué librerías incluir automáticamente
  },
})
