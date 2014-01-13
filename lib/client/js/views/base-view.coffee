define [
  "backbone"
], (Backbone) ->

  class BaseView extends Backbone.View

    initialize: ->
      @_views = []

    _registerView: (view) ->
      @_views.push view

    remove: ->
      while view = @_views.shift()
        view.remove()
      super

  BaseView