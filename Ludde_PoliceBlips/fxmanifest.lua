fx_version 'cerulean'
games { 'gta5' }


author "Ludde#6940 | https://discord.gg/qjNyTxK5M9"
description "This script adds blips to all the Police Cars around the Map for those with the Police Job."

server_scripts {
  '@mysql-async/lib/MySQL.lua',
  'config.lua',

  'server/server.lua'
}

client_scripts {
  'client/client.lua',
  'config.lua',
  'client/entityer.lua'
}