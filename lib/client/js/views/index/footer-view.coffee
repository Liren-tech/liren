define [
  "backbone"
  "handlebars.runtime"
  "templates"
], (Backbone, Handlebars) ->

  class FooterView extends Backbone.View

    className: "container"
    template: Handlebars.templates["footer"]

    render: ->
      @$el.html @template()

  FooterView