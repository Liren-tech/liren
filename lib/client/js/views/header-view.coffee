define [
  "backbone"
  "handlebars"
  "templates"
], (Backbone, Handlebars) ->

  class HeaderView extends Backbone.View

    tagName: "nav"
    className: "navbar navbar-inverse navbar-fixed-top"

    template: Handlebars.templates["header"]

    render: ->
      @$el.html @template()

  HeaderView