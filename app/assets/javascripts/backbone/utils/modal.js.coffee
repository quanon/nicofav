Utils = App.Utils

@App.module 'Utils.Modal', (Modal, App, Backbone, Marionette, $, _) ->

  resultMessage = (message) ->
    msg =
      if _.isArray(message)
        message.join('<br>')
      else
        message
    msg = Utils.String.nl2br(msg)
    msg

  # モーダルウィンドウを上下中央に表示する。
  # (参考) Vertically centering Bootstrap modal window
  # http://stackoverflow.com/questions/18053408/vertically-centering-bootstrap-modal-window
  centerModal = (modal) ->
    $modal = $(modal)
    $dialog = $modal.find('.modal-dialog')
    $navbar = $('.navbar')
    offset = (($(window).height() - $navbar.height()) - $dialog.height()) / 2
    $dialog.css('margin-top', $navbar.height() + offset)
    $modal

  $(window).on 'resize', ->
    _.each $('.modal:visible'), (modal) ->
      centerModal(modal)

  Modal.show = (element, options) ->
    defaultOptions =
      remove: false

    options = _.extend(defaultOptions, options)

    $modal = $(element).filter('.modal')

    $modal.on 'shown.bs.modal', ->
      centerModal($modal)

    $modal.on 'hidden.bs.modal', ->
      $modal.remove() if options.remove

    $modal.modal()

  Modal.confirm = (message, callback, options = {}) ->
    defaultOptions =
      message: resultMessage(message)
      title: JST['backbone/templates/utils/modal/confirm']()
      closeButton: false
      animate: false
      buttons:
        cancel:
          label: 'キャンセル'
          className: 'btn btn-warning pull-left'
        confirm:
          label: 'OK'
          className: 'btn btn-info'
      callback: callback

    $modal = bootbox.confirm(_.merge(defaultOptions, options))
    centerModal($modal)
    $modal

  Modal.alert = (message, callback, options = {}) ->
    defaultOptions =
      message: resultMessage(message)
      title: JST['backbone/templates/utils/modal/alert']()
      closeButton: false
      animate: false
      buttons:
        ok:
          label: 'OK'
          className: 'btn btn-info'
      callback: callback

    $modal = bootbox.alert(_.merge(defaultOptions, options))
    centerModal($modal)
    $modal
