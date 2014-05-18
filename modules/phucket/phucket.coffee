serv = require './service.coffee'
pack = require './package.coffee'
cmd = require './command.coffee'
log = require './logger.coffee'
templ = require './template.coffee'

GLOBAL.serv = new serv
GLOBAL.pack = new pack
GLOBAL.cmd = new cmd
GLOBAL.log = new log
GLOBAL.templ = new templ


GLOBAL.pack.installed "curl"