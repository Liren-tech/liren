define [
  "views/base-view"
  "handlebars.runtime"
  "templates"
], (BaseView, Handlebars) ->

  class HeaderView extends BaseView

    template: Handlebars.templates["header"]

    initialize: (opts) ->
      @_user = opts.user
      @listenTo @_user, "change", @render

    render: ->
      @$el.html @template @_user.toJSON()

  HeaderView