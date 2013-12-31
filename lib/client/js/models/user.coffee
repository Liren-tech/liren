define [
  "backbone"
], (Backbone) ->

  class User extends Backbone.Model

    idAttribute: "_id"

    defaults: ->
      email: ""
      portraitUrl: "images/default-portrait.jpg"

    url: ->
      "/user"

  User