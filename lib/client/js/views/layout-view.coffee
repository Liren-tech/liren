define [
  "backbone"
  "handlebars"
  "views/header-view"
  "views/footer-view"
  "templates"
], (Backbone, Handlebars, HeaderView, FooterView) ->

  class LayoutView extends Backbone.View

    el: "body"
    template: Handlebars.templates["layout"]

    initialize: ->
      @header = new HeaderView
      @footer = new FooterView
      @content = null

    render: ->
      @$el.html @template()
      @$("header").html @header.$el
      @header.render()
      @$("footer").html @footer.$el
      @footer.render()

    renderContent: (contentView) ->
      if @content
        @content.remove()
      @content = contentView
      @$("#content").html @content.$el
      @content.render()

    remove: ->
      @header.remove()
      @footer.remove()
      if @content
        @content.remove()
      super

  LayoutView