define [
  "backbone"
  "handlebars"
  "bootstrap"
  "templates"
], (Backbone, Handlebars) ->

  class SideNavView extends Backbone.View

    template: Handlebars.templates["side-nav"]

    initialize: (opts) ->
      @items = opts.items

    render: ->
      @$el.html @template @items
      @$el.affix()