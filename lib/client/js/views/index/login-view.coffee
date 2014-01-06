define [
  "async"
  "backbone"
  "handlebars.runtime"
  "jquery"
  "services/input-check-service"
  "templates"
], (async, Backbone, Handlebars, $, inputCheckService) ->

  class LoginView extends Backbone.View

    className: "container"
    template: Handlebars.templates["login"]

    events:
      "focusout #inputEmail": "onInputEmailFocusOut"
      "focusout #inputPassword": "onInputPasswordFocusOut"
      "submit form": "onFormSubmit"

    render: ->
      @$el.html @template()
      @

    focus: ->
      @$("#inpuEmail").focus()

    onInputEmailFocusOut: ->
      @_checkEmail()

    onInputPasswordFocusOut: ->
      @_checkPassword()

    onFormSubmit: ->
      $summary = @$ "#summary"
      $summary.empty()
      async.parallel [
        @_checkEmail
        @_checkPassword
      ], (error, results) ->
        if not error
          async.every results, (item, callback) ->
            callback item
          , (result) ->
            if result
              data =
                email: @$("#inputEmail").val()
                password: @$("#inputPassword").val()
              $.ajax "login",
                data: data
                type: "POST"
                error: (jqXHR) ->
                  $summary.html jqXHR.responseText
                success: ->
                  window.location = "main"
      false

    _checkEmail: (callback) ->
      $inputEmail = @$ "#inputEmail"
      email = $inputEmail.val()
      inputCheckService.checkEmail email, (error, result) ->
        if error or not result
          $inputEmail.parent().addClass "has-error"
          $inputEmail.siblings(".help-block").removeClass "hidden"
          $inputEmail.focus()
          if callback and "function" is typeof callback then callback null, false
        else
          $inputEmail.parent().removeClass "has-error"
          $inputEmail.siblings(".help-block").addClass "hidden"
          if callback and "function" is typeof callback then callback null, true

    _checkPassword: (callback) ->
      $inputPassword = @$ "#inputPassword"
      password = $inputPassword.val()
      inputCheckService.checkPassword password, (error, result) ->
        if error or not result
          $inputPassword.parent().addClass "has-error"
          $inputPassword.siblings(".help-block").removeClass "hidden"
          $inputPassword.focus()
          if callback and "function" is typeof callback then callback null, false
        else
          $inputPassword.parent().removeClass "has-error"
          $inputPassword.siblings(".help-block").addClass "hidden"
          if callback and "function" is typeof callback then callback null, true

  LoginView