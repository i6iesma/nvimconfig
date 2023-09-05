local setup, colorpicker = pcall(require, "color-picker")
if not setup then
	return
end
colorpicker.setup()
