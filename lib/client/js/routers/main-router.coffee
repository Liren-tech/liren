define [
  "backbone"
  "holder"
  "jquery"
  "models/user"
  "views/main/header-view"
  "views/main/footer-view"
  "views/main/main-view"
  "views/main/reading-view"
  "views/main/book-detail-view"
], (Backbone, Holder, $, User, HeaderView, FooterView, MainView, ReadingView, BookDetailView) ->

  class MainRouter extends Backbone.Router

    routes:
      "": "main"
      "reading": "reading"
      "books/:id": "bookDetail"
      "logout": "logout"

    initialize: ->
      @_user = new User
      @_user.fetch()
      @headerView = new HeaderView
        user: @_user
      $("header").html @headerView.render().$el
      @footerView = new FooterView
      $("footer").html @footerView.render().$el

    main: ->
      if @contentView
        @contentView.remove()
      @contentView = new MainView
      $("[role=content]").html @contentView.render().$el

    reading: ->
      if @contentView
        @contentView.remove()
      @contentView = new ReadingView
      $("[role=content]").html @contentView.render().$el
      Holder.run()

    bookDetail: (id) ->
      if @contentView
        @contentView.remove()
      @contentView = new BookDetailView
        id: id
      $("[role=content]").html @contentView.render().$el
      Holder.run()

    logout: ->
      $.ajax "logout",
        complete: ->
          window.location = "/"

  MainRouter