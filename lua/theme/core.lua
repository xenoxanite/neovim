package.path = package.path .. ";" .. os.getenv("HOME") .. "/.config/nvimc.lua"

return require("nvim-colors")
