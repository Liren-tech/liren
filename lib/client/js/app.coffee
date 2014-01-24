define [
  "backbone"
  "models/user"
  "routers/index-router"
  "routers/book-router"
  "views/layout-view"
], (Backbone, User, IndexRouter, BookRouter, LayoutView) ->

  App =

    initialize: ->

      @user = new User
      @user.fetch()

      @layout = new LayoutView
      @layout.render()

      new IndexRouter
        layout: @layout
      new BookRouter
        layout: @layout

      Backbone.history.start()

    login: (user) ->
      @user.set user
      window.location = "#"

    logout: ->
      @user.reset()
      window.location = "#"

    defaults:
      portraitUrl: "images/default-portrait.jpg"

  App