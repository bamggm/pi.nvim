# pi.nvim

A minimal Neovim plugin that integrates [Pi Agent](https://github.com/hchosen/pi.nvim) as an interactive terminal powered by [snacks.nvim](https://github.com/folke/snacks.nvim).

## Features

- **Interactive Terminal** - Open Pi Agent directly in Neovim
- **Send Visual Selections** - Select code in visual mode and send it to Pi Agent with file context (e.g., `@lua/pi/init.lua#L1-15`)

## Requirements

- Neovim >= 0.10 (required by snacks.nvim)
- [snacks.nvim](https://github.com/folke/snacks.nvim)
- [Pi Agent](https://github.com/hchosen/pi.nvim) CLI (`pi` command)

## Installation

### lazy.nvim

```lua
{
  "hchosen/pi.nvim",
  dependencies = { "folke/snacks.nvim" },
  keys = {
    { "<leader>ap", "<cmd>PiOpen<CR>", desc = "Open Pi Agent" },
    { "<leader>ap", "<cmd>PiSendSel<CR>", mode = "v", desc = "Send to Pi Agent" },
  },
}
```

#### Tmux Users (Optional)
You can use [`nvim-tmux-navigation`](https://github.com/alexghergh/nvim-tmux-navigation) and set the following bindings to easily navigate between terminal.

```lua
return {
  "alexghergh/nvim-tmux-navigation",
  lazy = false,
  config = function()
    -- terminal
    vim.keymap.set("t", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
    vim.keymap.set("t", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
    vim.keymap.set("t", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
    vim.keymap.set("t", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)

    -- tmux
    vim.keymap.set("n", "<C-h>", nvim_tmux_nav.NvimTmuxNavigateLeft)
    vim.keymap.set("n", "<C-j>", nvim_tmux_nav.NvimTmuxNavigateDown)
    vim.keymap.set("n", "<C-k>", nvim_tmux_nav.NvimTmuxNavigateUp)
    vim.keymap.set("n", "<C-l>", nvim_tmux_nav.NvimTmuxNavigateRight)
  end,
}
```

## Configuration

```lua
require("pi").setup({
  command = "pi",           -- Pi CLI command
  focus_on_sel = true,      -- Focus terminal after sending selection

  -- snacks terminal options
  terminal = {
    interactive = true,
    win = {
      position = "right",
      width = 0.30,
      height = 0,
      relative = "editor",
    },
  },
})
```

### Options

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `command` | string | `"pi"` | Pi CLI command |
| `focus_on_sel` | boolean | `true` | Focus terminal after sending selection |
| `terminal` | table | (see above) | snacks terminal options |

## Usage

### Commands

| Command | Description |
|---------|-------------|
| `:PiOpen` | Open Pi Agent in a terminal window |
| `:PiSendSel` | Send visual selection to Pi Agent |

### Sending Code to Pi Agent

1. Select code in visual mode (`v`, `V`, or `Ctrl+v`)
2. Press `<leader>ap`
3. The selection is sent with file context
4. Interact with Pi Agent in the terminal

## License

MIT License - see LICENSE file for details.

## Contributing

Contributions are welcome! Feel free to submit issues and pull requests.
