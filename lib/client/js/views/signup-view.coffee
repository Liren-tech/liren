define [
  "backbone"
  "handlebars.runtime"
  "templates"
], (Backbone, Handlebars) ->

  class SignupView extends Backbone.View

    className: "container"
    template: Handlebars.templates["signup"]

    render: ->
      @$el.html @template()
      @

  SignupView