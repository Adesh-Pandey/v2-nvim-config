-- import lspsaga safely
local saga_status, saga = pcall(require, "lspsaga")
if not saga_status then
  return
end

saga.setup({
  -- keybinds for navigation in lspsaga window
  scroll_preview = { scroll_down = "<C-f>", scroll_up = "<C-b>" },
  -- use enter to open file with definition preview
  definition = {
    edit = "<CR>",
  },
  ui = {
    colors = {
      normal_bg = "#022746",
    },
    enable = true,
    sign = true,
    virtual_text = true,
    kind = {},
  },
  symbol_in_winbar = {
    enable = false,
  },
  outline = {
    win_position = "right",
    win_width = 30,
    auto_preview = false,
    detail = false,
    keys = {
      toggle_or_jump = "<CR>",
      quit = "q",
    },
  },
})

