return {
  "mfussenegger/nvim-dap",
  init = function()
    -- Breakpoint keymaps
    vim.keymap.set("n", "<leader>db", "<cmd> DapToggleBreakpoint <CR>", { desc = "Toggle breakpoint" })

    -- Debug control keymaps
    vim.keymap.set("n", "<leader>dc", "<cmd> DapContinue <CR>", { desc = "Start/Continue debugging" })
    vim.keymap.set("n", "<leader>dt", "<cmd> DapTerminate <CR>", { desc = "Terminate debugging" })

    -- Step keymaps
    vim.keymap.set("n", "<leader>dso", "<cmd> DapStepOver <CR>", { desc = "Step over" })
    vim.keymap.set("n", "<leader>dsi", "<cmd> DapStepInto <CR>", { desc = "Step into" })
    vim.keymap.set("n", "<leader>dsO", "<cmd> DapStepOut <CR>", { desc = "Step out" })

    -- UI keymaps
    vim.keymap.set("n", "<leader>dus", function()
      local widgets = require("dap.ui.widgets")
      local sidebar = widgets.sidebar(widgets.scopes)
      sidebar.open()
    end, { desc = "Show scopes" })
  end,
  config = function()
    local dap = require("dap")

    -- Configure breakpoint icons
    vim.fn.sign_define("DapBreakpoint", { text = "●", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointCondition", { text = "◆", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapBreakpointRejected", { text = "○", texthl = "DapBreakpoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapLogPoint", { text = "◎", texthl = "DapLogPoint", linehl = "", numhl = "" })
    vim.fn.sign_define("DapStopped", { text = "→", texthl = "DapStopped", linehl = "DapStoppedLine", numhl = "" })

    -- Deno / JS debug adapter (installed via Mason as js-debug-adapter)
    local js_debug = vim.fn.stdpath("data") .. "/mason/packages/js-debug-adapter/js-debug/src/dapDebugServer.js"
    dap.adapters["pwa-node"] = {
      type = "server",
      host = "localhost",
      port = "${port}",
      executable = {
        command = "node",
        args = { js_debug, "${port}" },
      },
    }

    -- Attach to a running `deno test --inspect-brk` process (port 9229)
    local deno_attach = {
      type = "pwa-node",
      request = "attach",
      name = "Attach to Deno",
      attachSimplePort = 9229,
      cwd = "${workspaceFolder}",
      skipFiles = { "deno:*", "ext:*", "node:*", "<node_internals>/**" },
    }

    dap.configurations.typescript = { deno_attach }
    dap.configurations.javascript = { deno_attach }
  end,
}
