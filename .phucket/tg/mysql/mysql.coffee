fs = require 'fs'

module.exports = class

  @fileCounter = 0;

  properties:
    user:     "root"
    password: "password"

  ensureInstalled: ->
    cmd.execute 'echo "mysql-server-5.5 mysql-server/root_password password ' + @properties.password + '" | debconf-set-selections'
    cmd.execute 'echo "mysql-server-5.5 mysql-server/root_password_again password ' + @properties.password + '" | debconf-set-selections'
    ['mysql-server', 'mysql-client'].map (v) -> pack.installed v
    @

  executeSql: (sql) ->
    fcount = @fileCounter += 1;
    tmpFile = '/tmp/.phucketsql' + fcount
    fs.writeFileSync tmpFile, sql, options: encoding: 'utf-8'
    @executeSqlFile tmpFile
    fs.unlinkSync tmpFile

  executeSqlFile: (file) ->
    return cmd.execute 'cat ' + file + ' | mysql -u' + @properties.user + ' -p' + @properties.password

  ensureDatabase: (db) ->
    @executeSql 'CREATE DATABASE IF NOT EXISTS ' + db +  ' CHARACTER SET "utf8";';
    @

