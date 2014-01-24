define [
  "backbone"
  "models/action"
  "views/action-view"
], (Backbone, Action, ActionView) ->

  class BookRouter extends Backbone.Router

    initialize: (opts) ->
      @layout = opts.layout

    routes:
      "actions/:id": "info"

    info: (id) ->
      @_initView id
      @layout.renderContent @view
      @view.route "info"

    _initView: (id) ->
      if !@view or id isnt @action.id
        @action = new Action
          _id: id
        @action.fetch()
        @view = new ActionView
          model: @action