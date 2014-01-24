define [
  "async"
  "backbone"
  "handlebars"
  "collections/books"
  "views/book-thumbnail-view"
  "templates"
], (async, Backbone, Handlebars, Books, BookThumbnailView) ->

  class ReadingView extends Backbone.View

    className: "container"

    template: Handlebars.templates["reading"]

    initialize: ->

      @books = new Books
      @bookThumbnailViews = []

      @listenTo @books, "reset", @_renderBookList
      @books.fetch
        reset: true

    render: ->
      @$el.html @template()
      @_renderBookList()

    remove: ->
      @_removeBookList()
      super

    _renderBookList: ->
      @_removeBookList()
      $bookList = @$ "#book-list"
      @books.each (book) ->
        bookThumbnailView = new BookThumbnailView
          model: book
          className: "col-xs-3 margin-bottom-20"
        $bookList.append bookThumbnailView.$el
        bookThumbnailView.render()
        @bookThumbnailViews.push bookThumbnailView
      , @

    _removeBookList: ->
      while view = @bookThumbnailViews.shift()
        view.remove()
      @$("#book-list").empty()