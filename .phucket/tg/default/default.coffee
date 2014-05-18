module.exports = class

  ensureInstalled: ->
    ['vim', 'htop'].map (v) -> pack.installed v
    @