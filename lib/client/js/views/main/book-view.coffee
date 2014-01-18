define [
  "views/base-view"
  "handlebars.runtime"
  "holder"
  "views/main/side-nav-view"
  "bootstrap"
  "templates"
], (BaseView, Handlebars, Holder, SideNavView) ->

  class BookView extends BaseView

    template: Handlebars.templates["book"]

    initialize: ->
      super
      @_navItems = [
        {
          text: "基本信息"
          url: "#books/#{@model.id}"
          active: true
        }
        {
          text: "导读"
          url: "#books/#{@model.id}/guide"
        }
        {
          text: "书评"
          url: "#books/#{@model.id}/review"
        }
      ]
      @_leftSideView = new SideNavView
        items: @_navItems
      @listenTo @model, "change", @render

    render: ->

      @$el.html @template @model.toJSON()
      Holder.run()

      @$("#left-side-bar").html @_leftSideView.$el
      @_leftSideView.render()

  BookView