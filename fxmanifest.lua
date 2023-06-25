game 'gta5'

lua54 'yes'

fx_version 'adamant'

author 'Ramoune'


shared_scripts {
    "@es_extended/imports.lua",
    "config.lua",
}

client_scripts {
    "src/RMenu.lua",
    "src/menu/RageUI.lua",
    "src/menu/Menu.lua",
    "src/menu/MenuController.lua",
    "src/components/*.lua",
    "src/menu/elements/*.lua",
    "src/menu/items/*.lua",
    "src/menu/panels/*.lua",
    "src/menu/windows/*.lua",
    "client/*.lua"
}


server_scripts {
    "server/*.lua",
}