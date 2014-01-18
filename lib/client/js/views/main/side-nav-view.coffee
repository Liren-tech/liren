define [
  "views/base-view"
  "handlebars.runtime"
  "bootstrap"
  "templates"
], (BaseView, Handlebars) ->

  class SideNavView extends BaseView

    template: Handlebars.templates["side-nav"]

    initialize: (opts) ->
      @items = opts.items

    render: ->
      @$el.html @template @items
      @$el.affix()