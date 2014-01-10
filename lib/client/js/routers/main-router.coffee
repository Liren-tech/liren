define [
  "backbone"
  "jquery"
  "views/main/main-view"
  "views/main/reading-view"
], (Backbone, $, MainView, ReadingView) ->

  class MainRouter extends Backbone.Router

    routes:
      "": "main"
      "reading": "reading"
      "logout": "logout"

    initialize: (opts) ->
      @contentView = opts.contentView

    main: ->
      if @contentView
        @contentView.remove()
      @contentView = new MainView
      $("[role=content]").html @contentView.$el
      @contentView.render()

    reading: ->
      if @contentView
        @contentView.remove()
      @contentView = new ReadingView
      $("[role=content]").html @contentView.$el
      @contentView.render()

    logout: ->
      $.ajax "logout",
        complete: ->
          window.location = "/"

  MainRouter