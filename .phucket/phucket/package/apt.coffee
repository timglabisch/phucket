module.exports = class

  isInstalled: (name) ->
    if cmd.execute("dpkg -s " + name +  " | grep installed") is 0
      log.info "package " + name + " already installed"
      return true

    log.info "package " + name + " is not installed"
    return false;

  update: ->
    cmd.execute 'apt-get update'

  installed: (name) ->
    return if @isInstalled(name)
    cmd.execute 'apt-get install -y ' + name

  removed: (name) ->
    cmd.execute 'apt-get remove -y ' + name