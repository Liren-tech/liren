define [
  "backbone"
  "jquery"
  "common/global"
  "views/main/main-view"
  "views/main/reading-view"
], (Backbone, $, global, MainView, ReadingView) ->

  class MainRouter extends Backbone.Router

    routes:
      "": "main"
      "reading": "reading"
      "logout": "logout"

    main: ->
      @_renderContent new MainView

    reading: ->
      @_renderContent new ReadingView

    logout: ->
      $.ajax "logout",
        complete: ->
          window.location = "/"

    _renderContent: (view) ->
      if global.contentView
        global.contentView.remove()
      global.contentView = view
      $("#content").html view.$el
      view.render()