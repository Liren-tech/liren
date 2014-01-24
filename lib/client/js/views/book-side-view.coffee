define [
  "backbone"
  "handlebars"
  "underscore"
  "views/user-thumbnail-view"
  "views/action-thumbnail-view"
  "templates"
], (Backbone, Handlebars, _, UserThumbnailView, ActionThumbnailView) ->

  class BookSideView extends Backbone.View

    template: Handlebars.templates["book-side"]

    initialize: ->
      @userThumbnailViews = []
      @actionThumbnailViews = []
      @listenTo @model, "change", @render

    render: ->
      @$el.html @template()
      @_renderUserList()
      @_renderActionList()

    remove: ->
      @_removeUserList()
      @_removeActionList()
      super

    _renderUserList: ->
      @_removeUserList()
      $userList = @$ "#user-list"
      _.each @model.get("reviews"), (review) ->
        userThumbnailView = new UserThumbnailView
          model: review.user
          className: "col-xs-6 margin-bottom-20"
        $userList.append userThumbnailView.$el
        userThumbnailView.render()
        @userThumbnailViews.push userThumbnailView
      , @

    _renderActionList: ->
      @_removeActionList()
      $actionList = @$ "#action-list"
      _.each @model.get("actions"), (action) ->
        actionThumbnailView = new ActionThumbnailView
          model: action
          className: "margin-bottom-20"
        $actionList.append actionThumbnailView.$el
        actionThumbnailView.render()
        @actionThumbnailViews.push actionThumbnailView
      , @

    _removeUserList: ->
      while view = @userThumbnailViews.shift()
        view.remove()
      @$("#user-list").empty()

    _removeActionList: ->
      while view = @actionThumbnailViews.shift()
        view.remove()
      @$("#action-list").empty()