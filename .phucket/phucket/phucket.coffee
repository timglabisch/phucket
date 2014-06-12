diContainer = require("js_di")
fakt = require __dirname + "/core/fakt"

di = new diContainer
di.configure factories: fakt: -> new fakt


o = GLOBAL.o = (packageName) ->
  names = packageName.split(':')
  x = require __dirname + '/../' + names[0] + '/' + names[1] + '/' + names[1]

  if !x.configure
    return new x

  x.configure di, di.get('fakt')()
  return di.get(names[1])()



GLOBAL.serv = o 'phucket:service'
GLOBAL.pack = o 'phucket:package'
GLOBAL.cmd = o 'phucket:command'
GLOBAL.log = o 'phucket:logger'
GLOBAL.templ = o 'phucket:template'

GLOBAL.pack.installed "curl"

console.log("%j", di.get('package'))


try
  require __dirname + "/../phucket"
catch e
  console.log ""
  console.log "--- holy shit there is an exception --- --- ---- ----"
  console.log ""
  console.log e
  console.log ""
  console.log "--- --- --- ---- ---- --- ----- ----- ---- ----- ----"
  console.log ""
  throw e