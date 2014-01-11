define [
  "views/base-view"
  "handlebars.runtime"
  "templates"
], (BaseView, Handlebars) ->

  class MainView extends BaseView

    render: ->
      @$el.html "Main view."

  MainView