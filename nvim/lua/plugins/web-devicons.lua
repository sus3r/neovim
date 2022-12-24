local status, nvim_devicons = pcall(require, "nvim-web-devicons")
if not status then
	return
end

nvim_devicons.get_icons()
