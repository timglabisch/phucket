Twig = require "twig"
fs = require "fs"

module.exports = class

  renderString: (str, vars) ->
    return Twig.twig({data: str}).render(vars)

  ensureTemplate: (obj) ->
    path = obj.path
    template = obj.template
    vars = obj.vars || {}
    replaces = obj.replaces || {}
    appends = obj.appends || {}

    renderedTemplateString = @renderString (fs.readFileSync template, 'utf8'), vars

    for k, v of replaces
      renderedTemplateString = renderedTemplateString.replace(new RegExp(k, 'g'), v);

    for v of appends
      renderedTemplateString += "\n" + v

    if fs.existsSync path
      originalTemplate = fs.readFileSync path, 'utf8'

      return if renderedTemplateString == originalTemplate

    fs.writeFileSync path, renderedTemplateString
    log.debug "File " + path + " changed"
    obj.onChanged?()

  ensureNotExists: (path) ->
    if !fs.existsSync path
      log.debug "Dont need to drop " + path + ", it doest exists."
      return
    fs.unlinkSync path
    log.info "Drop file " + path



