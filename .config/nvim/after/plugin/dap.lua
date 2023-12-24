local dap, dapui = require("dap"), require("dapui")
dapui.setup()

-- Auto open and close dapui
dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

-- Breakpoints symbols
vim.fn.sign_define('DapBreakpoint',{ text = '⛔', texthl = '', linehl = '', numhl = ''})
vim.fn.sign_define('DapStopped',{ text = '▶️', texthl = '', linehl = '', numhl = ''})

-- Keymaps
vim.keymap.set('n', '<F5>', dap.continue)
vim.keymap.set('n', '<F10>', dap.step_over)
vim.keymap.set('n', '<F11>', dap.step_into)
vim.keymap.set('n', '<F12>', dap.step_out)
vim.keymap.set('n', '<C-b>', dap.toggle_breakpoint)

-- gdb
dap.adapters.gdb = {
  type = "executable",
  command = "gdb",
  args = { "-i", "dap" }
}

-- c
dap.configurations.c = {
  {
    name = "Launch",
    type = "gdb",
    request = "launch",
    program = function()
      return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
    end,
    cwd = "${workspaceFolder}",
  },
}
