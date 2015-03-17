@App.module 'Utils.BlockUI', (BlockUI, App, Backbone, Marionette, $, _) ->

  BlockUI.mask = ->
    $.blockUI
      message: '読み込み中'
      baseZ: 9000
      css:
        border: 'none'
        padding: '15px'
        backgroundColor: '#000'
        '-webkit-border-radius': '10px'
        '-moz-border-radius': '10px'
        'border-radius': '10px'
        opacity: '0.5'
        color: '#fff'

  BlockUI.unmask = ->
    $.unblockUI()
