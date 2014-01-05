define [
  "backbone"
  "handlebars.runtime"
  "collections/books"
  "templates"
], (Backbone, Handlebars, Books) ->

  class ReadingView extends Backbone.View

    template: Handlebars.templates["reading"]

    initialize: ->
      @_books = new Books
      @_books.fetch
        reset: true
      @listenTo @_books, "reset", @render

    render: ->
      console.log @_books
      @$el.html @template()
      @

  ReadingView