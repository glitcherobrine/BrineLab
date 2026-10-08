return {
  -- 1. Asegurar que Mason esté presente
  {
    "williamboman/mason.nvim",
    opts = {},
  },

  -- 2. Puente entre Mason y nvim-dap
  {
    "jay-babu/mason-nvim-dap.nvim",
    dependencies = { "williamboman/mason.nvim", "mfussenegger/nvim-dap" },
    opts = {
      handlers = {},
      ensure_installed = { "codelldb" }, -- Descarga automática del adaptador para C++
    },
  },

  -- 3. Core de DAP, Interfaz Gráfica y Atajos de Teclado
  {
    "mfussenegger/nvim-dap",
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Inicializar la interfaz gráfica (Esencial)
      dapui.setup()

      -- Automatizar la apertura y cierre de la UI (Sintaxis corregida)
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Atajo extra: Por si acaso quieres abrir/cerrar la UI manualmente
      vim.keymap.set('n', '<Leader>ui', function() dapui.toggle() end, { desc = "DAP Alternar Interfaz UI" }) 

      -- Mapeos de teclas para el proceso de depuración
      vim.keymap.set('n', '<F5>', function() dap.continue() end, { desc = "DAP Continuar / Iniciar" })
      vim.keymap.set('n', '<F10>', function() dap.step_over() end, { desc = "DAP Pasar Línea (Step Over)" })
      vim.keymap.set('n', '<F11>', function() dap.step_into() end, { desc = "DAP Entrar a Función (Step Into)" })
      vim.keymap.set('n', '<F12>', function() dap.step_out() end, { desc = "DAP Salir de Función (Step Out)" })
      vim.keymap.set('n', '<Leader>b', function() dap.toggle_breakpoint() end, { desc = "DAP Alternar Breakpoint" })
      vim.keymap.set('n', '<Leader>B', function() dap.set_breakpoint(vim.fn.input('Condición: ')) end, { desc = "DAP Breakpoint Condicional" })

      -- Configuración del comportamiento para C++
      dap.configurations.cpp = {
        {
          name = "Launch file",
          type = "codelldb",
          request = "launch",
          program = function()
            -- Te autocompleta la ruta actual para que solo escribas el nombre del binario
            return vim.fn.input('Ruta al ejecutable: ', vim.fn.getcwd() .. '/', 'file')
          end,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
	  console = "integratedTerminal",
        },
      }

      -- Reutiliza la misma lógica para archivos en C si los necesitas
      dap.configurations.c = dap.configurations.cpp
    end,
  },
}
