define [
  "backbone"
  "handlebars.runtime"
  "bootstrap"
  "templates"
], (Backbone, Handlebars) ->

  class IndexView extends Backbone.View

    className: "container"
    template: Handlebars.templates["index"]

    render: ->
      @$el.html @template()
      @

  IndexView