define [
  "backbone"
  "handlebars"
  "underscore"
  "views/review-view"
  "templates"
], (Backbone, Handlebars, _, ReviewView) ->

  class BookReviewsView extends Backbone.View

    template: Handlebars.templates["book-review"]

    initialize: ->
      @reviewViews = []
      @listenTo @model, "change", @render

    render: ->
      @$el.html @template()
      @_renderReviewList()

    _renderReviewList: ->
      @_removeReviewList()
      $reviewList = @$ "#review-list"
      _.each @model.get("reviews"), (review) ->
        view = new ReviewView
          review: review
          className: "margin-bottom-20"
        $reviewList.append view.$el
        view.render()
        @reviewViews.push view
      , @

    _removeReviewList: ->
      while view = @reviewViews.shift()
        view.remove()
      @$("#review-list").empty()