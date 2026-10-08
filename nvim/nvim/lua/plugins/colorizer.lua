return {
  "NvChad/nvim-colorizer.lua",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    require("colorizer").setup({
      user_default_options = {
        names = true, -- Resalta nombres de color en texto (ej. 'dimgray')
        css = true,   -- Habilita funciones de CSS comunes (rgb, hsl, etc.)
      },
    })
  end,
}

