define ->

  checkEmail = (email, callback) ->
    callback null, false

  # Password should at least have 8 charactors and include letters and numbers.
  checkPassword = (password, callback) ->
    callback null, false

  {
    checkEmail: checkEmail
    checkPassword: checkPassword
  }