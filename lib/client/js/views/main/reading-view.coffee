define [
  "backbone"
  "handlebars.runtime"
  "templates"
], (Backbone, Handlebars) ->

  class ReadingView extends Backbone.View

    render: ->
      @$el.html "Reading view."
      @

  ReadingView