define [
  "backbone"
  "handlebars"
  "holder"
  "templates"
], (Backbone, Handlebars, Holder) ->

  class BookInfoView extends Backbone.View

    template: Handlebars.templates["book-info"]

    initialize: ->
      @listenTo @model, "change", @render

    render: ->
      @$el.html @template @model.toJSON()
      Holder.run()