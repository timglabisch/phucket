php = load 'tg:php'
apache2 = load 'tg:apache2'
composer = load 'tg:composer'
symfony = load 'tg:symfony'

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