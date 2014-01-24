define [
  "backbone"
  "handlebars"
  "holder"
  "models/action"
  "templates"
], (Backbone, Handlebars, Holder, Action) ->

  class ActionThumbnailView extends Backbone.View

    template: Handlebars.templates["action-thumbnail"]

    render: ->
      if @model.constructor is Action
        context = @model.toJSON()
      else
        context = @model
      context.img =
        height: 180
      @$el.html @template context
      Holder.run()