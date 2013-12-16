path = require 'path'
requirejs = require 'requirejs'

requirejs.config
  baseUrl: path.join __dirname, '..', 'lib'
  nodeRequire: require

requirejs 'should'

describe 'server', ->

  describe 'repositories', ->

    ObjectID = requirejs('mongodb').ObjectID
    connectionString = 'mongodb://localhost:27017/liren-test'

    describe 'user repository', ->

      UserRepository = requirejs 'server/repositories/user-repository'
      userRepository = new UserRepository connectionString
      user = null

      beforeEach (done) ->
        userRepository.remove null, (error) ->
          if error then throw error
          done()
        user =
          username: 'test'
          password: 'test'

      it 'should insert user', (done) ->
        userRepository.insert user, (error) ->
          if error then throw error
          userRepository.findOne
            username: user.username
          , (error, doc) ->
            doc.should.have.property '_id'
            doc._id.should.be.an.instanceof ObjectID
            done()

  describe 'services', ->

    describe 'password hash service', ->

      passwordHashService = requirejs 'server/services/password-hash-service'
      password = 'password'
      wrongPassword = '123456'

      it 'should hash password', (done) ->
        passwordHashService.hash password, (error, hash) ->
          if error then throw error
          saltLength = Math.ceil(passwordHashService.SALT_SIZE / 3) * 4
          hashLength = Math.ceil(passwordHashService.HASH_SIZE / 3) * 4
          regExp = new RegExp "^[\\w\\d+/=]{#{saltLength}}:[\\w\\d+/=]{#{hashLength}}$"
          hash.should.match regExp
          done()

      it 'should validate password', (done) ->
        passwordHashService.hash password, (error, hash) ->
          if error then throw error
          passwordHashService.validate wrongPassword, hash, (error, result) ->
            if error then throw error
            result.should.be.false
            passwordHashService.validate password, hash, (error, result) ->
              if error then throw error
              result.should.be.true
              done()