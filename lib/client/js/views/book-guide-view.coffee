define [
  "backbone"
  "handlebars"
  "templates"
], (Backbone, Handlebars) ->

  class BookGuideView extends Backbone.View

    template: Handlebars.templates["book-guide"]

    initialize: ->
      @listenTo @model, "change", @render

    render: ->
      @$el.html @template()