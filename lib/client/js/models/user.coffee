define [
  "backbone"
], (Backbone) ->

  class User extends Backbone.Model

    idAttribute: "_id"

    defaults: ->
      portraitUrl: require("app").defaults.portraitUrl

    url: ->
      "/user"

    reset: ->
      @clear
        silent: true
      @set @defaults()