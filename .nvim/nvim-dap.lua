-- If you have no idea what this is for, it's for ldelossa/nvim-dap-projects.
-- It is very similar to a .vscode/launch.json, and allows specifying per-project debug configurations.
-- I use it to avoid having to enter the path of the executable I want to debug every single time I want to debug something.
local dap = require("dap")

-- See https://github.com/mfussenegger/nvim-dap/blob/master/doc/dap.txt for configuration options.
dap.adapters.lldb = {
  type = "executable", -- 'executable', 'server', or 'pipe'
  command = "/usr/bin/lldb-vscode",
  name = "lldb"
}

dap.configurations.c = {
  {
    name = "clox",
    type = "lldb",
    request = "launch",
    program = function()
      vim.fn.system("cd ${workspaceFolder}")
      vim.fn.system("meson build --buildtype=debug --reconfigure")
      vim.fn.system("cd build")
      vim.fn.system("meson compile")
      return "${workspaceFolder}/build/clox"
    end,
    cwd = "${workspaceFolder}",
    stopOnEntry = false,
    args = {}
  }
}
