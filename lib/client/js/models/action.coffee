define [
  "backbone"
], (Backbone) ->

  class Action extends Backbone.Model

    idAttribute: "_id"

    defaults: ->
      name: ""
      introduction: ""

    urlRoot: ->
      "/actions"