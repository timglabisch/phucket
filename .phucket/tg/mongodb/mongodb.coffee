ubuntu = require(__dirname + '/ubuntu')

module.exports = class

  @configure: (di, fakt) ->

    if fakt.getOs().isUbuntu()
      di.configure factories: mongodb: -> di.auto ubuntu
      return

    throw msg: "unknown mongodb handler"