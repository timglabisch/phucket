php = load 'tg:php'
apache2 = load 'tg:apache2'
composer = load 'tg:composer'
def = load 'tg:default'
symfony = load 'tg:symfony'
xdebug = load 'tg:xdebug'
mysql = load 'tg:mysql'

#cmd.execute "sudo apt-get update"

(new apache2)
  .ensureInstalled()
  .ensureModPhp()
  .ensureVHost 'SomeVHost',
    attributes:
      DocumentRoot: '/var/www/web'

(new php)
  .ensureInstalled()
  .ensurePhpIniCli()
  .ensureModulesInstalled ['mysql']
  .ensureFpm()

(new xdebug)
  .ensureInstalled()
  .ensureConfiguration()

(new composer)
  .ensureInstalled()

(new def)
  .ensureInstalled()

(new mysql)
  .ensureInstalled()
  .ensureDatabase('dev')
