define [
  "backbone"
  "handlebars"
  "holder"
  "models/book"
  "templates"
], (Backbone, Handlebars, Holder, Book) ->

  class BookThumbnailView extends Backbone.View

    template: Handlebars.templates["book-thumbnail"]

    render: ->
      if @model.constructor is Book
        context = @model.toJSON()
      else
        context = @model
      context.img =
        height: 180
      @$el.html @template context
      Holder.run()