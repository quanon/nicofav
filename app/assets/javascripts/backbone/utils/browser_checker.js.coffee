@App.module 'Utils.BrowserChecker', (BrowserChecker, App, Backbone, Marionette, $, _) ->

  # (参考) jQuery: check if user is using IE
  # http://stackoverflow.com/questions/19999388/jquery-check-if-user-is-using-ie
  BrowserChecker.ieVersion = ->
    userAgent = navigator.userAgent
    msie = userAgent.indexOf('MSIE ')

    if msie > 0 || !_.isEmpty(userAgent.match(/Trident.*rv\:11\./))
      return parseInt(userAgent.substring(msie + 5, userAgent.indexOf('.', msie)), 10)
    else
      return false
