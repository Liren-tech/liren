define [
  "backbone"
  "handlebars"
  "holder"
  "bootstrap"
  "templates"
], (Backbone, Handlebars, Holder) ->

  class IndexView extends Backbone.View

    className: "container"
    template: Handlebars.templates["index"]

    render: ->
      @$el.html @template()
      Holder.run()

  IndexView