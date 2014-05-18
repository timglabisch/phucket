merge = require 'merge'

module.exports = class

  ensureInstalled: ->
    pack.installed 'apache2'
    templ.ensureNotExists '/etc/apache2/sites-enabled/000-default'
    templ.ensureNotExists '/etc/apache2/sites-available/default'
    templ.ensureNotExists '/etc/apache2/sites-available/default-ssl'
    @

  getDefaultVars: ->
    listen: "*:80"
    attributes: {
      ServerAdmin: "foo@bar.com"
      DocumentRoot: "/var/www"
      ErrorLog: "${APACHE_LOG_DIR}/error.log"
      CustomLog: "${APACHE_LOG_DIR}/access.log combined"
    }
    server_admin: "foo@bar.com"
    document_root: "/var/www"
    directories: [
      {
        path: "/var/www"
        attributes: {
          Options: "Indexes FollowSymLinks MultiViews"
          AllowOverride:"All"
          Order: "allow,deny"
          allow: "from all"
        }
      }
    ]

  ensureModPhp: ->
    pack.installed 'libapache2-mod-php5'
    @

  ensureVHost: (name, vars = {}) ->
    templ.ensureTemplate
      path: '/etc/apache2/sites-enabled/' + name
      template: __dirname + '/templates/vhost.twig'
      vars: merge @getDefaultVars(), vars
      onChanged: ->
        serv.restart('apache2')
    @

