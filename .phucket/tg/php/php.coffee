module.exports = class

  ensureInstalled: ->
    ['php5', 'php5-cli', 'php5-dev', 'php5-intl'].map (v) -> pack.installed v
    @

  ensureModulesInstalled: (modules) ->
    pack.installed 'php5-' + module for module in modules
    @

  _ensurePhpIni: (file, obj) ->
    templ.ensureTemplate
      path: '/etc/php5/' + file + '.ini'
      template: __dirname + '/templates/' + file + '.ini.twig'
      replaces: obj.replaces
    @

  ensurePhpIniCli: (obj = { replaces: {} }) ->
    @_ensurePhpIni 'php-cli', obj

  ensureFpm: ( obj = {
      fpm:
        replaces: {}
      php:
        replaces: {}
  }) ->
    pack.installed 'php5-fpm'
    @_ensurePhpIni 'fpm/php', obj.php
    templ.ensureTemplate
      path: '/etc/php5/fpm/php-fpm.ini'
      template: __dirname + '/templates/fpm/php-fpm.conf.twig'
      replaces: obj.replaces
      onChanged: ->
        serv.restart('php5-fpm')
    @