define [
  "backbone"
  "handlebars.runtime"
  "holder"
  "models/book"
  "bootstrap"
  "templates"
], (Backbone, Handlebars, Holder, Book) ->

  class BookInfoView extends Backbone.View

    template: Handlebars.templates["book-info"]

    initialize: ->
      @listenTo @model, "change", @render

    render: ->
      @$el.html @template @model.toJSON()
      Holder.run()
      @$("[role=affix]").affix()

  BookInfoView