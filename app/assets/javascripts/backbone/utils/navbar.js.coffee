@App.module 'Utils.Navbar', (Navbar, App, Backbone, Marionette, $, _) ->

  Navbar.hide = ->
    $('.js-navbar').hide()
    # 21px = 本来の padding-top (81px) - navbar の height (60px)
    $('body').css('padding-top', '21px')
