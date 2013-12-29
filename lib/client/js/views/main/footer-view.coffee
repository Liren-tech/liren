define [
  "backbone"
  "handlebars.runtime"
  "templates"
], (Backbone, Handlebars) ->

  class FooterView extends Backbone.View

    template: Handlebars.templates["footer"]

    render: ->
      @$el.html @template()
      @

  FooterView