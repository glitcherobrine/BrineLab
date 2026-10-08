return {
  "kylechui/nvim-surround",
  version = "*", -- Usa la versión estable más reciente
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup()
  end,
}

