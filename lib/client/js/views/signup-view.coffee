define [
  "backbone"
  "handlebars.runtime"
  "services/input-check-service"
  "templates"
], (Backbone, Handlebars, inputCheckService) ->

  class SignupView extends Backbone.View

    className: "container"
    template: Handlebars.templates["signup"]

    events:
      "focusout #inputEmail": "onInputEmailFocusOut"
      "submit form": "onFormSubmit"

    render: ->
      @$el.html @template()
      @

    onInputEmailFocusOut: ->
      $inputEmail = @$ "#inputEmail"
      email = $inputEmail.val()
      inputCheckService.checkEmail email, (error, result) ->
        if error or not result
          $inputEmail.parent().addClass "has-error"
          $inputEmail.siblings(".help-block").removeClass "hidden"
        else
          $inputEmail.parent().removeClass "has-error"
          $inputEmail.siblings(".help-block").addClass "hidden"

    onFormSubmit: ->
      email = @$("#inputEmail").val()
      password = @$("#inputPassword").val()
      repeatPassword = @$("#inputRepeatPassword").val()


  SignupView