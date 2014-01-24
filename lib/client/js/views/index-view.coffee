define [
  "backbone"
  "handlebars"
  "holder"
  "collections/books"
  "collections/actions"
  "views/book-thumbnail-view"
  "views/action-thumbnail-view"
  "bootstrap"
  "templates"
], (Backbone, Handlebars, Holder, Books, Actions, BookThumbnailView, ActionThumbnailView) ->

  class IndexView extends Backbone.View

    className: "container"

    template: Handlebars.templates["index"]

    initialize: ->

      @books = new Books
      @actions = new Actions
      @bookThumbnailViews = []
      @actionThumbnailViews = []

      @listenTo @books, "reset", @_renderBookList
      @listenTo @actions, "reset", @_renderActionList
      @books.fetch
        reset: true
      @actions.fetch
        reset: true

    render: ->
      @$el.html @template()
      @_renderBookList()
      @_renderActionList()
      Holder.run()

    remove: ->
      @_removeBookList()
      super

    _renderBookList: ->
      @_removeBookList()
      $bookList = @$("#book-list")
      @books.each (book) ->
        bookThumbnailView = new BookThumbnailView
          model: book
          className: "col-xs-4 margin-bottom-20"
        $bookList.append bookThumbnailView.$el
        bookThumbnailView.render()
        @bookThumbnailViews.push bookThumbnailView
      , @

    _renderActionList: ->
      @_removeActionList()
      $actionList = @$("#action-list")
      @actions.each (action) ->
        actionThumbnailView = new ActionThumbnailView
          model: action
          className: "col-xs-12 margin-bottom-20"
        $actionList.append actionThumbnailView.$el
        actionThumbnailView.render()
        @actionThumbnailViews.push actionThumbnailView
      , @

    _removeBookList: ->
      while view = @bookThumbnailViews.shift()
        view.remove()
      @$("#book-list").empty()

    _removeActionList: ->
      while view = @actionThumbnailViews.shift()
        view.remove()
      @$("#action-list").empty()

  IndexView