define [
  "backbone"
  "holder"
  "jquery"
  "views/index/header-view"
  "views/index/footer-view"
  "views/index/index-view"
  "views/index/signup-view"
  "views/index/login-view"
], (Backbone, Holder, $, HeaderView, FooterView, IndexView, SignupView, LoginView) ->

  class IndexRouter extends Backbone.Router

    routes:
      "": "main"
      "signup": "signup"
      "login": "login"

    initialize: ->
      @headerView = new HeaderView
      $("header").html @headerView.render().$el
      @footerView = new FooterView
      $("footer").html @footerView.render().$el

    main: ->
      if @contentView
        @contentView.remove()
      @contentView = new IndexView
      $("[role=content]").html @contentView.render().$el
      Holder.run()

    signup: ->
      if @contentView
        @contentView.remove()
      @contentView = new SignupView
      $("[role=content]").html @contentView.render().$el
      @contentView.focus()

    login: ->
      if @contentView
        @contentView.remove()
      @contentView = new LoginView
      $("[role=content]").html @contentView.render().$el
      @contentView.focus()

  IndexRouter