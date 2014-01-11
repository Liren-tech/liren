define [
  "backbone"
], (Backbone) ->

  class BaseView extends Backbone.View

    initialize: ->
      @_views = []

    remove: ->
      while view = @_views.shift()
        view.remove()
      super

  BaseView