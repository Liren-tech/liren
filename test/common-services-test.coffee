path = require 'path'
requirejs = require 'requirejs'

requirejs.config
  baseUrl: path.join __dirname, '..', 'lib'
  nodeRequire: require

requirejs 'should'

async = requirejs 'async'

describe 'common serviecs', ->

  describe 'input check service', ->

    inputCheckService = requirejs 'common/js/services/input-check-service'

    it 'should check email', (done) ->
      rightEmail = 'test@gmail.com'
      wrongEmails = ['test', '@gmail.com', 'test@', 'test@gmail', 'test@gmail.']
      inputCheckService.checkEmail rightEmail, (error, result) ->
        if error then throw error
        result.should.be.true
        async.each wrongEmails, (email, callback) ->
          inputCheckService.checkEmail email, (error, result) ->
            if error then throw error
            result.should.be.false
            callback()
        , (error) ->
          if error then throw error
          done()

    it 'should check password', (done) ->
      rightPassword = 'passw0rd'
      wrongPasswords = ['password', 'passw0', '12345678']
      inputCheckService.checkPassword rightPassword, (error, result) ->
        if error then throw error
        result.should.be.true
        async.each wrongPasswords, (password, callback) ->
          inputCheckService.checkPassword password, (error, result) ->
            if error then throw error
            result.should.be.false
            callback()
          , (error) ->
            if error then throw error
            done()