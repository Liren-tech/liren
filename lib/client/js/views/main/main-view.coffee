define [
  "backbone"
  "handlebars.runtime"
  "templates"
], (Backbone, Handlebars) ->

  class MainView extends Backbone.View

    render: ->
      @$el.html "Main view."

  MainView