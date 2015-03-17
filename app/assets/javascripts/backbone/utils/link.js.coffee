@App.module 'Utils.Link', (Link, App, Backbone, Marionette, $, _) ->

  Link.getPathname = (element) ->
    $link = $(element)
    pathname = _.first($link)?.pathname

    # IE9 では pathname の先頭に / が付かない。
    if pathname.indexOf('/') == 0
      pathname
    else
      "/#{pathname}"
