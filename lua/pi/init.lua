local config = require("pi.config")
local terminal = require("pi.terminal")
local M = {}

function M.setup(opts)
  vim.print("setup called")
  config.setup(opts)

  vim.api.nvim_create_user_command("PiOpen", function(opts)
    terminal.open()
  end, { nargs = "*", desc = "Open Pi" })

  vim.api.nvim_create_user_command("PiSendSel", function(opts)
    terminal.send_selection()
  end, { nargs = "*", desc = "Pi visual select" })

  vim.keymap.set("v", "<leader>ap", "<cmd>PiSendSel<CR>", { noremap = true, silent = true })
  vim.keymap.set("n", "<leader>ap", "<cmd>PiOpen<CR>", { noremap = true, silent = true })
end

return M
