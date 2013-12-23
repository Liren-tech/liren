path = require 'path'
requirejs = require 'requirejs'

requirejs.config
  baseUrl: path.join __dirname, '..', 'lib'
  nodeRequire: require

requirejs 'should'

async = requirejs 'async'

describe 'server repositories', ->

  ObjectID = requirejs('mongodb').ObjectID
  connectionString = 'mongodb://localhost:27017/liren-test'

  describe 'user repository', ->

    UserRepository = requirejs 'server/repositories/user-repository'
    userRepository = new UserRepository connectionString
    users = [
      {
        email: 'email1@gmail.com'
        password: 'password1'
        details: 'details1'
      }
      {
        email: 'email2@gmail.com'
        password: 'password2'
        details: 'details2'
      }
    ]

    beforeEach (done) ->
      userRepository.init (error) ->
        if error then throw error
        async.each users, (user, callback) ->
          userRepository.insert user, callback # we cannot pass userRepository.insert as argument because it will lose context
        , (error) ->
          if error then throw error
          done()

    it 'should find user by email', (done) ->
      user = users[0]
      userRepository.findByEmail user.email, (error, doc) ->
        if error then throw error
        doc.should.have.property 'email'
        doc.email.should.equal user.email
        doc.should.have.property 'details'
        doc.details.should.equal user.details
        done()

    it 'should insert user', (done) ->
      user =
        email: 'email@gmail.com'
        password: 'password'
        details: 'details'
      userRepository.insert user, (error) ->
        if error then throw error
        userRepository.findByEmail user.email, (error, doc) ->
          if error then throw error
          doc.should.have.property '_id'
          doc._id.should.be.an.instanceof ObjectID
          doc.should.have.property 'email'
          doc.email.should.equal user.email
          doc.should.have.property 'details'
          doc.details.should.equal user.details
          done()

    it 'should stop inserting user with an existing email', (done) ->
      user = users[0]
      userRepository.insert user, (error) ->
        error.should.not.be.null
        done()

    it 'should update user', (done) ->
      email = users[0].email
      changedDetails = 'changed details'
      userRepository.findByEmail email, (error, doc) ->
        if error then throw error
        doc.details = changedDetails
        userRepository.update doc, (error) ->
          if error then throw error
          userRepository.findByEmail email, (error, doc) ->
            if error then throw error
            doc.should.have.property 'details'
            doc.details.should.equal changedDetails
            done()