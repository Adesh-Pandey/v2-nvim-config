-- local status, _ = pcall(vim.cmd, "colorscheme night-owl")

-- local status, _ = pcall(vim.cmd, "colorscheme rose-pine")
vim.o.background = "dark"
local status, _ = pcall(vim.cmd, "colorscheme catppuccin")
if not status then
	print("no colorscheme found")
	return
end

-- remove background color

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
-- function BarColors() end

function LineNumberColors()
	vim.api.nvim_set_hl(0, "LineNrAbove", { fg = "gray", bold = true })
	vim.api.nvim_set_hl(0, "LineNr", { fg = "gray", bold = true })
	vim.api.nvim_set_hl(0, "LineNrBelow", { fg = "gray", bold = true })
end

vim.cmd([[
  hi clear SignColumn
]])

LineNumberColors()

vim.cmd([[
  hi clear WinBar
    hi clear WinBarNC
]])

-- clears bg color for the code pane for tokyonight theme
vim.cmd([[
hi clear NormalNC
]])
