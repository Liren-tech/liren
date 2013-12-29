define [
  "backbone"
  "jquery"
  "views/main/header-view"
  "views/main/footer-view"
], (Backbone, $, HeaderView, FooterView) ->

  class MainRouter extends Backbone.Router

    routes:
      "": "main"

    initialize: ->
      @headerView = new HeaderView
      $("header").html @headerView.render().$el
      @footerView = new FooterView
      $("footer").html @footerView.render().$el

    main: ->
      $("[role=left-side-bar]").html "left side bar"
      $("[role=content]").html "contents"
      $("[role=right-side-bar]").html "right side bar"

  MainRouter