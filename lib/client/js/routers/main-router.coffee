define [
  "backbone"
  "jquery"
  "models/user"
  "views/main/header-view"
  "views/main/footer-view"
  "views/main/main-view"
  "views/main/reading-view"
], (Backbone, $, User, HeaderView, FooterView, MainView, ReadingView) ->

  class MainRouter extends Backbone.Router

    routes:
      "": "main"
      "reading": "reading"
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
      if @contentView
        @contentView.remove()
      @contentView = new MainView
      $("[role=content]").html @contentView.render().$el
      $("[role=right-side-bar]").html "right side bar"

    reading: ->
      $("[role=left-side-bar]").html "left side bar"
      if @contentView
        @contentView.remove()
      @contentView = new ReadingView
      $("[role=content]").html @contentView.render().$el
      $("[role=right-side-bar]").html "right side bar"

    logout: ->
      $.ajax "logout",
        complete: ->
          window.location = "/"

  MainRouter