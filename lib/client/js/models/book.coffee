define [
  "backbone"
], (Backbone) ->

  class Book extends Backbone.Model

    idAttribute: "_id"

    urlRoot: ->
      "/books"

  Book