define [
  "views/base-view"
  "handlebars.runtime"
  "holder"
  "templates"
], (BaseView, Handlebars, Holder) ->

  class BookListItemView extends BaseView

    template: Handlebars.templates["book-list-item"]

    render: ->
      @$el.html @template @model.toJSON()
      Holder.run()

  BookListItemView