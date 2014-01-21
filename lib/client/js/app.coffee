define [
  "backbone"
  "routers/index-router"
  "views/layout-view"
], (Backbone, IndexRouter, LayoutView) ->

  App =

    initialize: ->

      @layout = new LayoutView
      @layout.render()

      new IndexRouter
        layout: @layout

      Backbone.history.start()

  App