define ->

  checkEmail = (email, callback) ->
    reg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/
    callback null, reg.test email

  # Password should at least have 8 charactors and include letters and numbers.
  checkPassword = (password, callback) ->
    # TODO: improve the strength of password
    reg = /^([a-zA-Z0-9]){8,30}$/
    callback null, reg.test password

  
  
   # Nickname should at least have 3 charactors and include letters and numbers.
  checkNick = (nick, callback) ->
    # TODO: improve the strength of password
    reg = /^([a-zA-Z0-9]){3,30}$/
    callback null, reg.test nick
    
    {
    checkEmail: checkEmail
    checkPassword: checkPassword
    checkNick: checkNick
   }
