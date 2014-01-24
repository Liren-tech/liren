define [
  "backbone"
  "handlebars"
  "underscore"
  "views/user-thumbnail-view"
  "views/book-thumbnail-view"
  "templates"
], (Backbone, Handlebars, _, UserThumbnailView, BookThumbnailView) ->

  class ActionSideView extends Backbone.View

    template: Handlebars.templates["action-side"]

    initialize: ->
      @userThumbnailViews = []
      @bookThumbnailViews = []
      @listenTo @model, "change", @render

    render: ->
      @$el.html @template()
#      @_renderUserList()
      @_renderBookList()

    remove: ->
#      @_removeUserList()
      @_removeBookList()
      super

#    _renderUserList: ->
#      @_removeUserList()
#      $userList = @$ "#user-list"
#      _.each @model.get("reviews"), (review) ->
#        userThumbnailView = new UserThumbnailView
#          model: review.user
#          className: "col-xs-6 margin-bottom-20"
#        $userList.append userThumbnailView.$el
#        userThumbnailView.render()
#        @userThumbnailViews.push userThumbnailView
#      , @

    _renderBookList: ->
      @_removeBookList()
      $bookList = @$ "#book-list"
      _.each @model.get("books"), (book) ->
        bookThumbnailView = new BookThumbnailView
          model: book
          className: "col-xs-12 margin-bottom-20"
        $bookList.append bookThumbnailView.$el
        bookThumbnailView.render()
        @bookThumbnailViews.push bookThumbnailView
      , @

#    _removeUserList: ->
#      while view = @userThumbnailViews.shift()
#        view.remove()
#      @$("#user-list").empty()

    _removeBookList: ->
      while view = @bookThumbnailViews.shift()
        view.remove()
      @$("#book-list").empty()