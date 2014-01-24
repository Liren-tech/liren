define [
  "backbone"
  "handlebars"
  "views/side-nav-view"
  "views/book-info-view"
  "views/book-guide-view"
  "bootstrap"
  "templates"
], (Backbone, Handlebars, SideNavView, BookInfoView, BookGuideView) ->

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
          id: "review"
          text: "书评"
          url: "#books/#{@model.id}/review"
        }
      ]
      @leftSideView = new SideNavView
        items: @navItems

    render: ->
      @$el.html @template()
      @$("#left-side-bar").html @leftSideView.$el

    route: (router) ->

      @_removeMainView()
      switch router
        when "info"
          @mainView = new BookInfoView
            model: @model
        when "guide"
          @mainView = new BookGuideView
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


  BookView