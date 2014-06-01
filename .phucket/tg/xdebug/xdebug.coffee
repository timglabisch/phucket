module.exports = class

  ensureInstalled: ->
    return @ if cmd.execute("php -m xdebug | grep xdebug") is 0
    ['php-pear'].map (v) -> pack.installed v
    cmd.execute("pecl install xdebug")

    @

  ensureConfiguration: ->
    cmd.execute("echo zend_extension=`find /usr/lib/ -iname xdebug.so` > /etc/php5/conf.d/_xdebug_zendext.ini")
    cmd.execute("echo xdebug.remote_host=`ip route | awk '/^default/ {print $3}'` > /etc/php5/conf.d/_xdebug_host.ini")

    templ.ensureTemplate
      path: '/etc/php5/conf.d/xdebug.ini'
      template: __dirname + '/templates/xdebug.ini.twig'
    @

    # TODO
    # DROP DEPENDENCY!
    serv.reload "apache2"
