execSync = require('execSync')

module.exports = class

  executeContains: (command, name) ->
    result = execSync.exec command
    return result.stdout.indexOf(name) != -1

  exists: (command) ->
    return @execute "hash " + command

  execute: (command) ->
    result = execSync.exec command

    if result.code != 0
      console.log "ERR:  " + result.stdout

    return result.code