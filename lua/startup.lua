local pathlib = require('plenary.path')

local CONFIG_FILENAME = '.nvimrc.lua'
local cwd = vim.fn.getcwd()
local project_config_file = pathlib.new(cwd, CONFIG_FILENAME)

if pathlib.exists(project_config_file) and pathlib.is_file(project_config_file) then
    dofile(pathlib.absolute(project_config_file))
end
