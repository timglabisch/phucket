module.exports = class

  installed: (name) ->
    if cmd.execute("dpkg -s " + name +  " | grep installed") is 0
      log.info "package " + name + " already installed"
      return

    log.info "install package " + name
    cmd.execute 'apt-get install -y ' + name

  removed: (name) ->
    cmd.execute 'apt-get remove -y ' + name