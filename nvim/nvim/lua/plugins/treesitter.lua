return {
  "nvim-treesitter/nvim-treesitter",
  event = { "BufReadPre", "BufNewFile" },
  build = ":TSUpdate",
  config = function()
    -- pcall intenta ejecutar el require. Si falla, 'ok' será false en vez de lanzar un error.
    local ok, ts_configs = pcall(require, "nvim-treesitter.configs")
    if not ok then 
      return 
    end

    ts_configs.setup({
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}
