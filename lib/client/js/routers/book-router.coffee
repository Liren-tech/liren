define [
  "backbone"
  "models/book"
  "views/book-view"
  "views/book-guide-view"
], (Backbone, Book, BookView) ->

  class BookRouter extends Backbone.Router

    initialize: (opts) ->
      @layout = opts.layout

    routes:
      "books/:id": "info"
      "books/:id/guide": "guide"

    info: (id) ->
      @_initView id
      @layout.renderContent @view
      @view.route "info"

    guide: (id) ->
      @_initView id
      @layout.renderContent @view
      @view.route "guide"

    _initView: (id) ->
      if !@view or id isnt @book.id
        @book = new Book
          _id: id
        @book.fetch()
        @view = new BookView
          model: @book

  BookRouter