define [
  "backbone"
  "handlebars.runtime"
  "templates"
], (Backbone, Handlebars) ->

  class BookSummaryView extends Backbone.View

    template: Handlebars.templates["book-summary"]

    render: ->
      @$el.html @template @model.toJSON()
      @

  BookSummaryView