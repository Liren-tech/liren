define [
  "views/base-view"
  "async"
  "handlebars.runtime"
  "holder"
  "collections/books"
  "views/main/book-list-item-view"
  "templates"
], (BaseView, async, Handlebars, Holder, Books, BookListItemView) ->

  class ReadingView extends BaseView

    template: Handlebars.templates["reading"]

    initialize: ->
      super
      @_books = new Books
      @_books.fetch
        reset: true
      @listenTo @_books, "reset", @render

    render: ->
      @$el.html @template()
      $main = @$ "#main"
      @_books.each (book) ->
        view = new BookListItemView
          model: book
          className: "col-xs-6"
        @_registerView view
        $main.append view.$el
        view.render()
      , @

  ReadingView