define [
  "backbone"
  "views/index-view"
  "views/signup-view"
  "views/login-view"
], (Backbone, IndexView, SignupView, LoginView) ->

  class IndexRouter extends Backbone.Router

    initialize: (opts) ->
      @layout = opts.layout

    routes:
      "": "index"
      "signup": "signup"
      "login": "login"
      "logout": "logout"

    index: ->
      @layout.renderContent new IndexView

    signup: ->
      @layout.renderContent new SignupView

    login: ->
      @layout.renderContent new LoginView

    logout: ->
      $.ajax "logout",
        complete: ->
          require("app").logout()

  IndexRouter