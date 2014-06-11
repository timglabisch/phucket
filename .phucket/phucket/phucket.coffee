diContainer = require("js_di")
fakt = require __dirname + "/core/fakt"

di = new diContainer
di.configure factories: fakt: -> new fakt


load = GLOBAL.load = (packageName) ->
  names = packageName.split(':')
  return require __dirname + '/../' + names[0] + '/' + names[1] + '/' + names[1]

foo = GLOBAL.foo = (packageName) ->
  names = packageName.split(':')
  x = require __dirname + '/../' + names[0] + '/' + names[1] + '/' + names[1]
  console.log "%s", x
  throw msg: 'missing configure method.' if !x.configure
  x.configure di, di.get('fakt')()
  return di.get(names[1])()



GLOBAL.serv = new (load 'phucket:service')
GLOBAL.pack = foo 'phucket:package'
GLOBAL.cmd = new (load 'phucket:command')
GLOBAL.log = new (load 'phucket:logger')
GLOBAL.templ = new (load 'phucket:template')

GLOBAL.pack.installed "curl"

console.log("%j", di.get('package'))


require __dirname + "/../phucket"