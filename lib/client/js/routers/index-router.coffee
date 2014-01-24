define [
  "backbone"
  "views/index-view"
  "views/reading-view"
  "views/acting-view"
  "views/signup-view"
  "views/login-view"
], (Backbone, IndexView, ReadingView, ActingView, SignupView, LoginView) ->

  class IndexRouter extends Backbone.Router

    initialize: (opts) ->
      @layout = opts.layout

    routes:
      "": "index"
      "reading": "reading"
      "acting": "acting"
      "signup": "signup"
      "login": "login"
      "logout": "logout"

    index: ->
      @layout.renderContent new IndexView

    reading: ->
      @layout.renderContent new ReadingView

    acting: ->
      @layout.renderContent new ActingView

    signup: ->
      @layout.renderContent new SignupView

    login: ->
      @layout.renderContent new LoginView

    logout: ->
      $.ajax "logout",
        complete: ->
          require("app").logout()

  IndexRouter