
# Example manifest to build a LAMP Stack.

o 'tg:apache2'
  .ensureInstalled()
  .ensureModPhp()
  .ensureVHost 'SomeVHost',
    attributes:
      DocumentRoot: '/var/www/web'

o 'tg:php'
  .ensureInstalled()
  .ensurePhpIniCli()
  .ensureModulesInstalled ['mysql']
  .ensureFpm()

o 'tg:xdebug'
  .ensureInstalled()
  .ensureConfiguration()

o 'tg:composer'
  .ensureInstalled()

o 'tg:default'
  .ensureInstalled()

o 'tg:mysql'
  .ensureInstalled()
  .ensureDatabase('dev')

o 'tg:mongodb'
  .ensureInstalled()