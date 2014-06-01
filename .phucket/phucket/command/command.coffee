execSync = require('execSync')

module.exports = class

  executeContains: (command, name) ->
    result = execSync.exec command
    return result.stdout.indexOf(name) != -1

  exists: (command) ->
    return @execute "hash " + command

  execute: (command) ->
    result = execSync.exec command

    if result.code not in [0, 100]
      log.debug "ERR:  " + result.stdout

    return result.code