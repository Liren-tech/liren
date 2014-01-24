define [
  "backbone"
  "handlebars"
  "holder"
  "views/side-nav-view"
  "bootstrap"
  "templates"
], (Backbone, Handlebars, Holder, SideNavView) ->

  class BookView extends Backbone.View

    className: "container"
    template: Handlebars.templates["book"]

    initialize: ->
      @navItems = [
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
      @leftSideView = new SideNavView
        items: @navItems
      @listenTo @model, "change", @render

    render: ->
      @$el.html @template @model.toJSON()
      Holder.run()
      @$("#left-side-bar").html @leftSideView.$el
      @leftSideView.render()

    remove: ->
      @leftSideView.remove()
      super


  BookView