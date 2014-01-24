define [
  "backbone"
  "handlebars"
  "holder"
  "templates"
], (Backbone, Handlebars, Holder) ->

  class ActionInfoView extends Backbone.View

    template: Handlebars.templates["action-info"]

    initialize: ->
      @listenTo @model, "change", @render

    render: ->
      @$el.html @template @model.toJSON()
      Holder.run()