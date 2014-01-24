define [
  "async"
  "backbone"
  "handlebars"
  "holder"
  "collections/books"
  "views/book-thumbnail-view"
  "templates"
], (async, Backbone, Handlebars, Holder, Books, BookThumbnailView) ->

  class ReadingView extends Backbone.View

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
      Holder.run()

    remove: ->
      @_removeBookList()
      super

    _renderBookList: ->
      @_removeBookList()
      $bookList = @$("#book-list")
      @books.each (book) ->
        bookThumbnailView = new BookThumbnailView
          model: book
          className: "col-xs-3"
        $bookList.append bookThumbnailView.$el
        bookThumbnailView.render()
        @bookThumbnailViews.push bookThumbnailView
      , @

    _removeBookList: ->
      while view = @bookThumbnailViews.shift()
        view.remove()
      @$("#book-list").empty()

  ReadingView