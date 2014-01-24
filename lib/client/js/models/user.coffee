define [
  "backbone"
], (Backbone) ->

  class User extends Backbone.Model

    idAttribute: "_id"

    defaults: ->
      portraitUrl: "images/default-portrait.jpg"

    url: ->
      "/user"

    reset: ->
      @clear
        silent: true
      @set @defaults()