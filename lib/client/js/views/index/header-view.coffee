define [
  "views/base-view"
  "handlebars.runtime"
  "templates"
], (BaseView, Handlebars) ->

  class HeaderView extends BaseView

    className: "container"
    template: Handlebars.templates["header"]

    render: ->
      @$el.html @template()

  HeaderView