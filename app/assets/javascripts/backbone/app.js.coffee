#= require_self
#= require_tree ./templates
#= require_tree ./utils

@App = do (Backbone) ->
  app = new Backbone.Marionette.Application

  app.on 'start', ->
    options =
      pushState: true
      hashChange: false # don't want to rewrite /pathname to #pathname

    # override getHash
    # this can fire backbone router when url doesn't has hash fragment
    Backbone.history.getHash = ->
      if window.location.search
        search = window.location.search
      else
        search = ''
      return window.location.pathname

    Backbone.history.start(options)

  app

$(document).on 'ready', ->
  # errors/show が render された場合は App を起動しない。
  return false if $('.js-has-errors').length > 0

  # Marionette.Application を起動する。
  App.start()

# Ajax 通信時のエラーハンドリングを行う。
$(document).ajaxError (event, xhr, settings) ->
  messages = $.parseJSON(xhr.responseText)

  # Devise が発生させた例外の場合
  if _.isPlainObject(messages) && messages.error
    messages = messages.error

  switch xhr.status
    when 401
      $alert = App.Utils.Modal.alert(messages)
      $alert.on 'hidden.bs.modal', ->
        window.location.replace('/login')
    else
      $alert = App.Utils.Modal.alert(messages)

# JSON リクエストでも flash メッセージを表示したい！
# Ajax 通信終了時に JavaScript 側から flash メッセージの表示を行う。
# (参考) How do you handle Rail's flash with Ajax requests?
# http://stackoverflow.com/questions/366311/how-do-you-handle-rails-flash-with-ajax-requests
$(document).ajaxComplete (event, xhr, settings) ->
  flash = $.parseJSON(xhr.getResponseHeader('X-Flash-Messages'))
  return if _.isEmpty(flash)

  $flash = $('.js-flash')
  $flash.empty()

  index = 1
  _.each flash, (message, type) ->

    alertType =
      switch type
        when 'notice'
          'success'
        when 'warning'
          'warning'
        when 'error'
          'danger'
        else
          'info'

    alertId = "js-alert-#{index}"
    decodedMessage = decodeURIComponent(message)

    $flash.append """
      <div class='alert alert-#{alertType}' data-alert-id='#{alertId}'>
        <a class='close' data-target='[data-alert-id=#{alertId}]' data-dismiss='alert'>&times;</a>
        <div>#{decodedMessage}</div>
      </i>
    """

    index++

  return
