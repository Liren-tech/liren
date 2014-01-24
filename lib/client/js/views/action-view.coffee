define [
  "backbone"
  "handlebars"
  "views/side-nav-view"
  "views/action-side-view"
  "views/action-info-view"
  "templates"
], (Backbone, Handlebars, SideNavView, ActionSideView, ActionInfoView) ->

  class ActionView extends Backbone.View

    className: "container"
    template: Handlebars.templates["action"]

    initialize: ->
      @navItems = [
        {
          id: "info"
          text: "基本信息"
          url: "#actions/#{@model.id}"
        }
      ]
      @leftSideView = new SideNavView
        items: @navItems

      @rightSideView = new ActionSideView
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
          @mainView = new ActionInfoView
            model: @model
        else
          @mainView = new ActionInfoView
            model: @model
      @$("#main").html @mainView.$el
      @mainView.render()

      @leftSideView.route router

    remove: ->
      @leftSideView.remove()
      @_removeMainView()
      @rightSideView.remove()
      super

    _removeMainView: ->
      if @mainView
        @mainView.remove()
        @$("#main").empty()