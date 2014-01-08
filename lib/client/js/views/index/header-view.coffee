define [
  "backbone"
  "handlebars.runtime"
  "templates"
], (Backbone, Handlebars) ->

  class HeaderView extends Backbone.View

    className: "container"
    template: Handlebars.templates["header"]

    render: ->
      @$el.html @template()

  HeaderView