define [
  "backbone"
  "handlebars"
  "views/side-nav-view"
  "views/book-side-view"
  "views/book-info-view"
  "views/book-guide-view"
  "views/book-reviews-view"
  "bootstrap"
  "templates"
], (Backbone, Handlebars, SideNavView, BookSideView, BookInfoView, BookGuideView, BookReviewsView) ->

  class BookView extends Backbone.View

    className: "container"
    template: Handlebars.templates["book"]

    initialize: ->
      @navItems = [
        {
          id: "info"
          text: "基本信息"
          url: "#books/#{@model.id}"
        }
        {
          id: "guide"
          text: "导读"
          url: "#books/#{@model.id}/guide"
        }
        {
          id: "reviews"
          text: "书评"
          url: "#books/#{@model.id}/reviews"
        }
      ]
      @leftSideView = new SideNavView
        items: @navItems

      @rightSideView = new BookSideView
        model: @model

    render: ->
      @$el.html @template()
      @$("#left-side-bar").html @leftSideView.$el
      @$("#right-side-bar").html @rightSideView.$el
      @rightSideView.render()

    route: (router) ->

      @_removeMainView()
      switch router
        when "info"
          @mainView = new BookInfoView
            model: @model
        when "guide"
          @mainView = new BookGuideView
            model: @model
        when "reviews"
          @mainView = new BookReviewsView
            model: @model
        else
          @mainView = new BookInfoView
            model: @model
      @$("#main").html @mainView.$el
      @mainView.render()

      @leftSideView.route router

    remove: ->
      @leftSideView.remove()
      @_removeMainView()
      super

    _removeMainView: ->
      if @mainView
        @mainView.remove()
        @$("#main").empty()