define [
  "backbone"
], (Backbone) ->

  class Book extends Backbone.Model

    idAttribute: "_id"

    defaults: ->
      name: ""
      authors: []
      introduction: ""
      reviews: []

    urlRoot: ->
      "/books"