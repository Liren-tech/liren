define [
  "backbone"
  "holder"
  "jquery"
  "views/header-view"
  "views/footer-view"
  "views/index-view"
], (Backbone, Holder, $, HeaderView, FooterView, IndexView) ->

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

    login: ->

  IndexRouter