fs = require "fs"

module.exports = class

  ensureInstalled: (
    obj = {
      webroot: '/var/www',
    }
  ) ->
    if fs.existsSync(obj.webroot + "/app") || fs.existsSync(obj.webroot + "/vendors") || fs.existsSync(obj.webroot + "/_symfony")
      log.debug "Symfoy already installed"
      return

    cmd.execute "mkdir -p " + obj.webroot + "/_symfony"
    cmd.execute "composer create-project symfony/framework-standard-edition " + obj.webroot + "/_symfony 2.4.*"
    cmd.execute "mv " + obj.webroot + "/_symfony/(DN)  " + obj.webroot
    cmd.execute "rmdir " + obj.webroot + "/_symfony"
    log.info "installed Symfony"