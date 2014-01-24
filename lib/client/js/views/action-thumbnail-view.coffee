define [
  "backbone"
  "handlebars"
  "holder"
  "templates"
], (Backbone, Handlebars, Holder) ->

  class ActionThumbnailView extends Backbone.View

    template: Handlebars.templates["action-thumbnail"]

    render: ->
      context = @model.toJSON()
      context.img =
        height: 180
      @$el.html @template context
      Holder.run()

  ActionThumbnailView