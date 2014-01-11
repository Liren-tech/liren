define [
  "views/base-view"
  "handlebars.runtime"
  "templates"
], (BaseView, Handlebars) ->

  class FooterView extends BaseView

    template: Handlebars.templates["footer"]

    render: ->
      @$el.html @template()

  FooterView