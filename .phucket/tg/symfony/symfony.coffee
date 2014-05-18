module.exports = class

  ensureCachePermission: (
    path = '/var/www'
  ) ->
    cmd.execute 'chmod -R 777 ' + path + '/app/cache'
    cmd.execute 'chmod -R 777 ' + path + '/app/logs'
    @
