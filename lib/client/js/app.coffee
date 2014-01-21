define [
  "backbone"
  "models/user"
  "routers/index-router"
  "views/layout-view"
], (Backbone, User, IndexRouter, LayoutView) ->

  App =

    initialize: ->

      @user = new User
      @user.fetch()

      @layout = new LayoutView
      @layout.render()

      new IndexRouter
        layout: @layout

      Backbone.history.start()

    login: (user) ->
      @user.set user
      window.location = "#"

    logout: ->
      @user.reset()
      window.location = "#"

  App