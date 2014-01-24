define [
  "backbone"
  "handlebars"
  "templates"
], (Backbone, Handlebars) ->

  class UserThumbnailView extends Backbone.View

    template: Handlebars.templates["user-thumbnail"]

    render: ->
      if !@model.portraitUrl
        @model.portraitUrl = require("app").defaults.portraitUrl
      @$el.html @template @model