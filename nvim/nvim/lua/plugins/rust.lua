return {
  {
    'mrcjkb/rustaceanvim',
    version = '^5',
    lazy = false,
    init = function()
      vim.g.rustaceanvim = {
        server = {
          default_settings = {
            ['rust-analyzer'] = {
              checkOnSave = true,
              check = {
                command = "clippy",
              },
            },
          },
        },
      }
    end,
  },
  {
    'saecki/crates.nvim',
    tag = 'stable',
    event = { "BufRead Cargo.toml" },
    config = function()
      require('crates').setup()
    end,
  },
}
