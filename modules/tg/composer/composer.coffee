module.exports = class

  ensureInstalled: ->
    if !cmd.exists "composer"
      log.debug "Composer already installed"
      return
    cmd.execute "curl -sS https://getcomposer.org/installer | php"
    cmd.execute "mv composer.phar /usr/local/bin/composer"
    log.info "installed Composer"