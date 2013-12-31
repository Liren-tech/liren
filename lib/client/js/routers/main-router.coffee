define [
  "backbone"
  "jquery"
  "models/user"
  "views/main/header-view"
  "views/main/footer-view"
], (Backbone, $, User, HeaderView, FooterView) ->

  class MainRouter extends Backbone.Router

    routes:
      "": "main"
      "logout": "logout"

    initialize: ->
      @_user = new User
      @_user.fetch()
      @headerView = new HeaderView
        user: @_user
      $("header").html @headerView.render().$el
      @footerView = new FooterView
      $("footer").html @footerView.render().$el

    main: ->
      $("[role=left-side-bar]").html "left side bar"
      $("[role=content]").html "contents"
      $("[role=right-side-bar]").html "right side bar"

    logout: ->
      # TODO: logout

  MainRouter