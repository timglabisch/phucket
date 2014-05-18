load = GLOBAL.load = (packageName) ->
  names = packageName.split(':')
  return require __dirname + '/../' + names[0] + '/' + names[1] + '/' + names[1]

GLOBAL.serv = new (load 'phucket:service')
GLOBAL.pack = new (load 'phucket:package')
GLOBAL.cmd = new (load 'phucket:command')
GLOBAL.log = new (load 'phucket:logger')
GLOBAL.templ = new (load 'phucket:template')


GLOBAL.pack.installed "curl"

require __dirname + "/../../provisioner"