define [
  "backbone"
  "jquery"
  "models/user"
  "views/main/header-view"
  "views/main/footer-view"
  "views/main/main-view"
  "views/main/reading-view"
  "views/main/book-detail-view"
], (Backbone, $, User, HeaderView, FooterView, MainView, ReadingView, BookDetailView) ->

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
      $("header").html @headerView.$el
      @headerView.render()
      @footerView = new FooterView
      $("footer").html @footerView.$el
      @footerView.render()

    main: ->
      if @contentView
        @contentView.remove()
      @contentView = new MainView
      $("[role=content]").html @contentView.$el
      @contentView.render()

    reading: ->
      if @contentView
        @contentView.remove()
      @contentView = new ReadingView
      $("[role=content]").html @contentView.$el
      @contentView.render()

    bookDetail: (id) ->
      if @contentView
        @contentView.remove()
      @contentView = new BookDetailView
        bookId: id
      $("[role=content]").html @contentView.$el
      @contentView.render()

    logout: ->
      $.ajax "logout",
        complete: ->
          window.location = "/"

  MainRouter