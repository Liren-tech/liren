define [
  "backbone"
  "handlebars"
  "templates"
], (Backbone, Handlebars) ->

  class ReviewView extends Backbone.View

    template: Handlebars.templates["review"]

    render: ->
      if !@model.user.portraitUrl
        @model.user.portraitUrl = require("app").defaults.portraitUrl
      @$el.html @template @model