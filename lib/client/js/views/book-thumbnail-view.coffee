define [
  "backbone"
  "handlebars"
  "holder"
  "templates"
], (Backbone, Handlebars, Holder) ->

  class BookThumbnailView extends Backbone.View

    template: Handlebars.templates["book-thumbnail"]

    render: ->
      context = @model.toJSON()
      context.img =
        height: 180
      @$el.html @template context
      Holder.run()