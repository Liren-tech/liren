define [
  "backbone"
  "handlebars.runtime"
  "templates"
], (Backbone, Handlebars) ->

  class LoginView extends Backbone.View

    className: "container"
    template: Handlebars.templates["login"]

    render: ->
      @$el.html @template()
      @

  LoginView