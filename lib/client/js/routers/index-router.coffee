define [
  "backbone"
  "jquery"
  "views/index/header-view"
  "views/index/footer-view"
  "views/index/index-view"
  "views/index/signup-view"
  "views/index/login-view"
], (Backbone, $, HeaderView, FooterView, IndexView, SignupView, LoginView) ->

  class IndexRouter extends Backbone.Router

    routes:
      "": "main"
      "signup": "signup"
      "login": "login"

    initialize: ->
      @headerView = new HeaderView
      $("header").html @headerView.$el
      @headerView.render()
      @footerView = new FooterView
      $("footer").html @footerView.$el
      @footerView.render()

    main: ->
      if @contentView
        @contentView.remove()
      @contentView = new IndexView
      $("[role=content]").html @contentView.$el
      @contentView.render()

    signup: ->
      if @contentView
        @contentView.remove()
      @contentView = new SignupView
      $("[role=content]").html @contentView.$el
      @contentView.render()

    login: ->
      if @contentView
        @contentView.remove()
      @contentView = new LoginView
      $("[role=content]").html @contentView.$el
      @contentView.render()

  IndexRouter