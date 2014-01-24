define [
  "backbone"
  "handlebars"
  "underscore"
  "bootstrap"
  "templates"
], (Backbone, Handlebars, _) ->

  class SideNavView extends Backbone.View

    template: Handlebars.templates["side-nav"]

    initialize: (opts) ->
      @items = opts.items

    render: ->
      @$el.html @template @items
      @$el.affix()

    route: (router) ->
      _.each @items, (item) ->
        if item.id is router
          item.active = true
        else
          item.active = false
      @render()