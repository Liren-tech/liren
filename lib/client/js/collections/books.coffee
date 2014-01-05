define [
  "backbone"
  "models/book"
], (Backbone, Book) ->

  class Books extends Backbone.Collection

    model: Book

    url: ->
      "/books"

  Books