fs = require "fs"

module.exports = class

  ensureInstalled: (
    obj = {
      webroot: '/var/www'
    }
  ) ->
    if fs.existsSync(obj.webroot + "/app")
      log.debug "Symfoy already installed"
      return

    cmd.execute "composer create-project symfony/framework-standard-edition " + obj.webroot + "/_tmp 2.4.*"
    cmd.execute "mv " + obj.webroot + "/_tmp/(DN)  " + obj.webroot
    cmd.execute "rmdir " + obj.webroot + "/_tmp"
    log.info "installed Symfony"