define [
  "backbone"
  "views/index-view"
#  "views/index/signup-view"
#  "views/index/login-view"
], (Backbone, IndexView) ->

  class IndexRouter extends Backbone.Router

    initialize: (opts) ->
      @layout = opts.layout

    routes:
      "": "index"
#      "signup": "signup"
#      "login": "login"

    index: ->
      @layout.renderContent new IndexView

#    signup: ->
#      @_renderContent new SignupView
#
#    login: ->
#      @_renderContent new LoginView

#    _renderContent: (view) ->
#      if global.contentView
#        global.contentView.remove()
#      global.contentView = view
#      $("#content").html view.$el
#      view.render()

  IndexRouter