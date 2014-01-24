define [
  "backbone"
  "handlebars"
  "holder"
  "templates"
], (Backbone, Handlebars, Holder) ->

  class ActionThumbnailView extends Backbone.View

    template: Handlebars.templates["action-thumbnail"]

    render: ->
      if @model is typeof Backbone.Model
        context = @model.toJSON()
      else
        context = @model
      context.img =
        height: 180
      @$el.html @template context
      Holder.run()