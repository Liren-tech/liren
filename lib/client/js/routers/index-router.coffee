define [
  "backbone"
  "views/index-view"
  "views/reading-view"
  "views/signup-view"
  "views/login-view"
], (Backbone, IndexView, ReadingView, SignupView, LoginView) ->

  class IndexRouter extends Backbone.Router

    initialize: (opts) ->
      @layout = opts.layout

    routes:
      "": "index"
      "reading": "reading"
      "signup": "signup"
      "login": "login"
      "logout": "logout"

    index: ->
      @layout.renderContent new IndexView

    reading: ->
      @layout.renderContent new ReadingView

    signup: ->
      @layout.renderContent new SignupView

    login: ->
      @layout.renderContent new LoginView

    logout: ->
      $.ajax "logout",
        complete: ->
          require("app").logout()

  IndexRouter