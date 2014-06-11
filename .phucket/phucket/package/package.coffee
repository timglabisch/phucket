apt = require(__dirname + '/apt')

module.exports = class

  @configure: (di, fakt) ->

    if fakt.getOs().isUbuntu()
      di.configure factories: package: -> new apt
      return

    throw msg: "unknown package manager"