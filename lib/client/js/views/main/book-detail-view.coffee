define [
  "backbone"
  "handlebars.runtime"
  "models/book"
  "templates"
], (Backbone, Handlebars, Book) ->

  class BookDetailView extends Backbone.View

    initialize: (opts) ->
      @_id = opts.id
      @model = new Book
        _id: @_id
      @model.fetch()
      @listenTo @model, "change", @render

    render: ->
      @$el.html @model.get "name"

  BookDetailView