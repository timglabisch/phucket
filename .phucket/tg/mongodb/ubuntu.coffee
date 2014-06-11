module.exports = class

  constructor: (@package) ->

  ensureInstalled: ->
    return @ if @package.isInstalled('mongodb-org')
    cmd.execute "sudo apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10"
    cmd.execute "echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | sudo tee /etc/apt/sources.list.d/mongodb.list"
    @package.update()
    @package.installed "mongodb-org"
    @