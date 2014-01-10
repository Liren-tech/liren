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

    initialize: (opts) ->
      @contentView = opts.contentView

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