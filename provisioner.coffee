require './modules/phucket/phucket.coffee'


php = require './modules/tg/php/php.coffee'
apache2 = require './modules/tg/apache2/apache2.coffee'
composer = require './modules/tg/composer/composer.coffee'
symfony = require './modules/tg/symfony/symfony.coffee'

#cmd.execute "sudo apt-get update"

(new apache2)
  .ensureInstalled()
  .ensureVHost 'SomeVHost'

(new php)
  .ensureInstalled()
  .ensurePhpIniCli()
  .ensureFpm()

(new composer)
  .ensureInstalled()
###
(new symfony)
  .ensureInstalled()

###