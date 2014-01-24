define [
  "backbone"
  "handlebars"
  "templates"
], (Backbone, Handlebars) ->

  class ReviewView extends Backbone.View

    template: Handlebars.templates["review"]

    render: ->
      @$el.html @template()