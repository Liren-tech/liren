define [
  "backbone"
  "handlebars.runtime"
  "templates"
], (Backbone, Handlebars) ->

  class BookDetailView extends Backbone.View

    initialize: (opts) ->
      @_id = opts.id

    render: ->
      @$el.html @_id
      @

  BookDetailView