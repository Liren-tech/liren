define [
  "backbone"
  "jquery"
  "common/global"
  "views/index/index-view"
  "views/index/signup-view"
  "views/index/login-view"
], (Backbone, $, global, IndexView, SignupView, LoginView) ->

  class IndexRouter extends Backbone.Router

    routes:
      "": "main"
      "signup": "signup"
      "login": "login"

    main: ->
      @_renderContent new IndexView

    signup: ->
      @_renderContent new SignupView

    login: ->
      @_renderContent new LoginView

    _renderContent: (view) ->
      if global.contentView
        global.contentView.remove()
      global.contentView = view
      $("#content").html view.$el
      view.render()

  IndexRouter