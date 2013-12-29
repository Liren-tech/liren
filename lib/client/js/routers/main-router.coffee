define [
  "backbone"
  "jquery"
], (Backbone, $) ->

  class MainRouter extends Backbone.Router

    routes:
      "": "main"

    initialize: ->

    main: ->
      $("header").html "header"
      $("[role=left-side-bar]").html "left side bar"
      $("[role=content]").html "contents"
      $("[role=right-side-bar]").html "right side bar"
      $("footer").html "footer"

  MainRouter