return {
  "mfussenegger/nvim-dap",
  event = "BufReadPre",
  config = function()
    local dap = require("dap")

    dap.adapters.python = function(callback, config)
      callback({
        type = "executable",
        command = "python",
        args = { "-m", "debugpy.adapter" },
      })
    end

    dap.configurations.python = {
      {
        type = "python",
        request = "launch",
        name = "Start Debugging Session",
        program = "${file}",
      },
    }
  end,
}
