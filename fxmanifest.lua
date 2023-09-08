fx_version 'adamant'
game 'gta5'

client_scripts {
    "shared/sh_config.lua",
	"client_modules/modules/handler/cl_handler.lua",
}

server_scripts {
    "shared/sh_config.lua",
    "server_modules/modules/handler/sv_handler.lua",
    "server_modules/connection/*.lua",
    "server_modules/playerManager/*.lua",
    "server_modules/event/*.lua",
}