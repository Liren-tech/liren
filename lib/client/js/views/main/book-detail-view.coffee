define [
  "backbone"
  "handlebars.runtime"
  "holder"
  "models/book"
  "bootstrap"
  "templates"
], (Backbone, Handlebars, Holder, Book) ->

  class BookDetailView extends Backbone.View

    template: Handlebars.templates["book-detail"]

    initialize: (opts) ->
      @model = new Book
        _id: opts.bookId
      @model.fetch()
      @listenTo @model, "change", @render

    render: ->
      @$el.html @template @model.toJSON()
      Holder.run()
      @$("[role=affix]").affix()

  BookDetailView