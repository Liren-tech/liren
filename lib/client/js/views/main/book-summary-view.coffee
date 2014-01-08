define [
  "backbone"
  "handlebars.runtime"
  "holder"
  "templates"
], (Backbone, Handlebars, Holder) ->

  class BookSummaryView extends Backbone.View

    template: Handlebars.templates["book-summary"]

    render: ->
      @$el.html @template @model.toJSON()
      Holder.run()

  BookSummaryView