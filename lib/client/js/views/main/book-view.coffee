define [
  "views/base-view"
  "handlebars.runtime"
  "holder"
  "bootstrap"
  "templates"
], (BaseView, Handlebars, Holder) ->

  class BookView extends BaseView

    template: Handlebars.templates["book"]

    initialize: ->
      super
      @listenTo @model, "change", @render

    render: ->
      @$el.html @template @model.toJSON()
      Holder.run()
      @$("[role=affix]").affix()

  BookView