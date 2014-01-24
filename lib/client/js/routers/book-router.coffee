define [
  "backbone"
  "models/book"
  "views/book-view"
], (Backbone, Book, BookView) ->

  class BookRouter extends Backbone.Router

    initialize: (opts) ->
      @layout = opts.layout

    routes:
      "books/:id": "info"

    info: (id) ->
      @book = new Book
        _id: id
      @book.fetch()
      @layout.renderContent new BookView
        model: @book

  BookRouter