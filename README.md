# PHUCKET predictable and effective
phucket is just another automation framework.

for now it's just a prototype

## phucket rules
- effective
- predictable. run everything in the same order. everytime.
- no painful new dsl. just plain javascript / coffee-script, npm

## Predictable
the most important rule of it-automation is that everything must be predictable.
using a complex dependency graph is just pain.

## No Painful New Dsl
Did you ever tried to write great and useful scripts for it automation?
Most dsl's doesn't allow you to write high quality and easy to use code.

## Basic Usage


Example:

```
# .phucket/phucket.coffee

php = load 'tg:php'
apache2 = load 'tg:apache2'
composer = load 'tg:composer'
def = load 'tg:default'
symfony = load 'tg:symfony'

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
  .ensureFpm()

(new composer)
  .ensureInstalled()

(new def)
  .ensureInstalled()
```


## Basic Functions

### pack (package)
#### installed
Example
```
pack.installed "htop"
```

### serv (service)
#### restart
#### isRunning
#### start
#### stop
#### reload

Example
```
    serv.restart 'apache2
```

### cmd (command)
#### execute
```
cmd.execute 'chmod -R 777 '/var/www/app/cache'
```

### tmpl (template)
phucket comes with a depdendency to twig.js
here is an example how to render a template from the apache module

```
merge = require 'merge'
module.exports = class

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

  ensureVHost: (name, vars = {}) ->
    templ.ensureTemplate
      path: '/etc/apache2/sites-enabled/' + name
      template: __dirname + '/templates/vhost.twig'
      vars: merge @getDefaultVars(), vars
      onChanged: ->
        serv.restart('apache2')
    @
```

### log (logger)
#### log.info "some info"
#### log.debug "some debug"
#### log.error "some error"


