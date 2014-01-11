define [
  "backbone"
  "jquery"
  "common/global"
  "models/book"
  "views/main/book-view"
], (Backbone, $, global, Book, BookView) ->

  class BookRouter extends Backbone.Router

    routes:
      "books/:id": "info"

    info: (id) ->
      if !@_book or @_book.id isnt id
        @_book = new Book
          _id: id
        @_book.fetch()
      if view = global.contentView
        view.remove()
      global.contentView = view = new BookView
        model: @_book
      $("#content").html view.$el
      view.render()

  BookRouter