define [
  "views/base-view"
  "handlebars.runtime"
  "holder"
  "bootstrap"
  "templates"
], (BaseView, Handlebars, Holder) ->

  class IndexView extends BaseView

    className: "container"
    template: Handlebars.templates["index"]

    render: ->
      @$el.html @template()
      Holder.run()

  IndexView