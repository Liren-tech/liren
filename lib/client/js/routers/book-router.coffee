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
      "books/:id/guide": "guide"
      "books/:id/reviews": "reviews"

    info: (id) ->
      @_initView id
      @layout.renderContent @view
      @view.route "info"

    guide: (id) ->
      @_initView id
      @layout.renderContent @view
      @view.route "guide"

    reviews: (id) ->
      @_initView id
      @layout.renderContent @view
      @view.route "reviews"

    _initView: (id) ->
      if !@view or id isnt @book.id
        @book = new Book
          _id: id
        @book.fetch()
        @view = new BookView
          model: @book