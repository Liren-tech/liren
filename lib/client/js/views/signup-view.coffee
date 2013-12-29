define [
  "async"
  "backbone"
  "handlebars.runtime"
  "services/input-check-service"
  "templates"
], (async, Backbone, Handlebars, inputCheckService) ->

  class SignupView extends Backbone.View

    className: "container"
    template: Handlebars.templates["signup"]

    events:
      "focusout #inputEmail": "onInputEmailFocusOut"
      "focusout #inputPassword": "onInputPasswordFocusOut"
      "focusout #inputRepeatPassword": "onInputRepeatPasswordFocusOut"
      "submit form": "onFormSubmit"

    render: ->
      @$el.html @template()
      @

    focus: ->
      @$("#inputEmail").focus()

    onInputEmailFocusOut: ->
      console.log "email focus out"
      @_checkEmail()

    onInputPasswordFocusOut: ->
      console.log "password focus out"
      @_checkPassword()

    onInputRepeatPasswordFocusOut: ->
      console.log "repeat password focus out"
      @_checkRepeatPassword()

    onFormSubmit: ->
      console.log "submit"
      async.parallel [
        @_checkEmail
        @_checkPassword
        @_checkRepeatPassword
      ], (error, results) ->
        if not error
          async.every results, (item, callback) ->
            callback item
          , (result) ->
#            if result
              # TODO

    _checkEmail: (callback) ->
      $inputEmail = @$ "#inputEmail"
      email = $inputEmail.val()
      inputCheckService.checkEmail email, (error, result) ->
        if error or not result
          $inputEmail.parent().addClass "has-error"
          $inputEmail.siblings(".help-block").removeClass "hidden"
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
        if callback and "function" is typeof callback then callback null, true
      else
        $inputRepeatPassword.parent().removeClass "has-error"
        $inputRepeatPassword.siblings(".help-block").addClass "hidden"
        if callback and "function" is typeof callback then callback null, false

  SignupView