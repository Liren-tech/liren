define [
  'crypto'
], (crypto) ->

  ITERATIONS = 1000
  SALT_SIZE = 24
  HASH_SIZE = 24

  hash = (password, callback) ->
    crypto.pseudoRandomBytes SALT_SIZE, (error, salt) ->
      if error
        callback error
        return
      crypto.pbkdf2 password, salt, ITERATIONS, HASH_SIZE, (error, hash) ->
        if error
          callback error
          return
        buffer = new Buffer hash, 'binary'
        callback null, salt.toString('base64') + ':' + buffer.toString 'base64'

  validate = (password, hash, callback) ->
    split = hash.split ':'
    salt = new Buffer split[0], 'base64'
    crypto.pbkdf2 password, salt, ITERATIONS, HASH_SIZE, (error, hash) ->
      if error
        callback error
        return
      buffer = new Buffer hash, 'binary'
      if split[1] is buffer.toString 'base64'
        callback null, true
      else
        callback null, false

  {
    SALT_SIZE: SALT_SIZE
    HASH_SIZE: HASH_SIZE
    hash: hash
    validate: validate
  }