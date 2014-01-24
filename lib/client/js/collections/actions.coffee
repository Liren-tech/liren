define [
  "backbone"
  "models/action"
], (Backbone, Action) ->

  class Actions extends Backbone.Collection

    model: Action

    url: ->
      "actions"

  Actions