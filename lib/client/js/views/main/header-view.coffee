define [
  "backbone"
  "handlebars.runtime"
  "templates"
], (Backbone, Handlebars) ->

  class HeaderView extends Backbone.View

    template: Handlebars.templates["header"]

    initialize: (opts) ->
      @_user = opts.user
      @listenTo @_user, "change", @render

    render: ->
      @$el.html @template @_user.toJSON()

  HeaderView