define [
  "backbone"
  "handlebars.runtime"
  "holder"
  "templates"
], (Backbone, Handlebars, Holder) ->

  class BookListItemView extends Backbone.View

    template: Handlebars.templates["book-list-item"]

    render: ->
      @$el.html @template @model.toJSON()
      Holder.run()

  BookListItemView