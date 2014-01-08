define [
  "async"
  "backbone"
  "handlebars.runtime"
  "holder"
  "collections/books"
  "views/main/book-summary-view"
  "templates"
], (async, Backbone, Handlebars, Holder, Books, BookSummaryView) ->

  class ReadingView extends Backbone.View

    template: Handlebars.templates["reading"]

    initialize: ->
      @_books = new Books
      @_books.fetch
        reset: true
      @listenTo @_books, "reset", @render
      @_bookViews = []

    render: ->
      @$el.html @template()
      $main = @$ "[role=main]"
      @_books.each (book) ->
        view = new BookSummaryView
          model: book
          className: "col-xs-6"
        @_bookViews.push view
        $main.append view.$el
        view.render()
      , @

    remove: ->
      while view = @_bookViews.shift()
        view.remove()
      super

  ReadingView