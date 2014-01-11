define [
  "views/base-view"
  "handlebars.runtime"
  "templates"
], (BaseView, Handlebars) ->

  class BookLeftSideView extends BaseView

    template: Handlebars.templates["book-left-side"]

    initialize: (bookId, activeRoute) ->
      @model =
        bookId: bookId
        activeRoute: activeRoute

    render: ->
      @$el.html @template @model