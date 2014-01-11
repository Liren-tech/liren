define [
  "views/base-view"
  "async"
  "handlebars.runtime"
  "jquery"
  "services/input-check-service"
  "templates"
], (BaseView, async, Handlebars, $, inputCheckService) ->

  class SignupView extends BaseView

    className: "container"
    template: Handlebars.templates["signup"]

    events:
      "focusout #inputEmail": "onInputEmailFocusOut"
      "focusout #inputPassword": "onInputPasswordFocusOut"
      "focusout #inputRepeatPassword": "onInputRepeatPasswordFocusOut"
      "submit form": "onFormSubmit"

    render: ->
      @$el.html @template()
      @$("#inputEmail").focus()

    onInputEmailFocusOut: ->
      @_checkEmail()

    onInputPasswordFocusOut: ->
      @_checkPassword()

    onInputRepeatPasswordFocusOut: ->
      @_checkRepeatPassword()

    onFormSubmit: ->
      $summary = @$ "#summary"
      $summary.empty()
      async.parallel [
        @_checkEmail
        @_checkPassword
        @_checkRepeatPassword
      ], (error, results) ->
        if not error
          async.every results, (item, callback) ->
            callback item
          , (result) ->
            if result
              data =
                email: @$("#inputEmail").val()
                password: @$("#inputPassword").val()
              $.ajax "signup",
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

    _checkRepeatPassword: (callback) ->
      $inputRepeatPassword = @$ "#inputRepeatPassword"
      password = @$("#inputPassword").val()
      repeatPassword = $inputRepeatPassword.val()
      if password isnt repeatPassword
        $inputRepeatPassword.parent().addClass "has-error"
        $inputRepeatPassword.siblings(".help-block").removeClass "hidden"
        $inputRepeatPassword.focus()
        if callback and "function" is typeof callback then callback null, false
      else
        $inputRepeatPassword.parent().removeClass "has-error"
        $inputRepeatPassword.siblings(".help-block").addClass "hidden"
        if callback and "function" is typeof callback then callback null, true

  SignupView