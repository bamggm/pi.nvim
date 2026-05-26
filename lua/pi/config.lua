local M = {}

---Default configuration
local defaults = {
  command = "pi",
  -- snacks terminal argument
  terminal = {
    interactive = true,
    win = {
      position = "right",
      width = 0.30,
      height = 0,
      relative = "editor",
    },
  },

  focus_on_sel = true,
}

function M.setup(opts)
  M.opts = vim.tbl_deep_extend("force", defaults, opts or {})
  M.loaded = true
end

return M