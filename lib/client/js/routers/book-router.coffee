define [
  "backbone"
  "jquery"
  "models/book"
  "views/main/book-info-view"
], (Backbone, $, Book, BookInfoView) ->

  class BookRouter extends Backbone.Router

    routes:
      "books/:id": "bookDetail"

    initialize: (opts) ->
      @contentView = opts.contentView

    bookDetail: (id) ->
      @_fetchBook id
      if @contentView
        @contentView.remove()
      @contentView = new BookInfoView
        model: @_book
      $("[role=content]").html @contentView.$el
      @contentView.render()

    _fetchBook: (id) ->
      if !@_book or @_book.id isnt id
        @_book = new Book
          _id: id
        @_book.fetch()

  BookRouter