@App.module 'Utils.String', (String, App, Backbone, Marionette, $, _) ->

  String.nl2br = (str) ->
    return '' unless str?
    str.replace(/\n|\r|\r\n/g, '<br>')

  String.br2nl = (str) ->
    return '' unless str?
    str.replace(/<br\s*[\/]?>/g, '\n')
