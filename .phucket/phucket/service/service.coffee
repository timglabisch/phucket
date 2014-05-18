module.exports = class

  restart: (name) ->
    return if !@isRunning name
    log.info "service " + name + " restart"
    cmd.execute('service ' + name + ' restart')

  isRunning: (name) ->
    !cmd.executeContains('service ' + name + ' status', 'NOT')

  start: (name) ->
    return if isRunning name
    log.info "service start " + name
    cmd.execute('service ' + name + ' start')

  stop: (name) ->
    return if !isRunning name
    log.info "service stop " + name
    cmd.execute('service ' + name + ' stop')

  reload: (name) ->
    if isRunning name
      log.info "service reload " + name
      cmd.execute('service ' + name + ' reload')
    else
      @start()
