local dap = require("dap")

dap.adapters.lldb = {
  type = "executable",
  command = vim.fn.stdpath("data") .. "/mason/bin/codelldb", -- adjust as needed, must be absolute path
  name = "lldb",
}

dap.configurations.c = {
  {
    name = "Launch",
    type = "lldb",
    request = "launch",
    program = function()
      return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {},
  },
}

dap.configurations.cpp = dap.configurations.c
