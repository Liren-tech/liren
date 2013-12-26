define [
  "backbone"
  "handlebars.runtime"
  "templates"
], (Backbone, Handlebars) ->

  class LoginView extends Backbone.View

    className: "container"
    template: Handlebars.templates["login"]

    events:
      "submit form": "onFormSubmit"

    render: ->
      @$el.html @template()
      @

    onFormSubmit: ->
      # TODO

  LoginView