
function setColorscheme(colorscheme)
	colorscheme = colorscheme or "melange"
	vim.cmd.colorscheme(colorscheme)

	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
	vim.api.nvim_set_hl(0, "Normal", { bg = "none" })

end

setColorscheme()
