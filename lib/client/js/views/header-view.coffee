define [
  "backbone"
  "handlebars"
  "templates"
], (Backbone, Handlebars) ->

  class HeaderView extends Backbone.View

    tagName: "nav"
    className: "navbar navbar-inverse navbar-fixed-top"

    template: Handlebars.templates["header"]

    initialize: ->
      user = require("app").user
      @listenTo user, "change", @render

    render: ->
      user = require("app").user
      @$el.html @template
        user: if user.id then user.toJSON()

  HeaderView