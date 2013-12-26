define [
  "backbone"
  "handlebars.runtime"
  "templates"
], (Backbone, Handlebars) ->

  class SignupView extends Backbone.View

    className: "container"
    template: Handlebars.templates["signup"]

    events:
      "submit form": "onFormSubmit"

    render: ->
      @$el.html @template()
      @

    onFormSubmit: ->
      # TODO

  SignupView