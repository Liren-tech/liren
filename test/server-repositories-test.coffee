path = require 'path'
requirejs = require 'requirejs'

requirejs.config
  baseUrl: path.join __dirname, '..', 'lib'
  nodeRequire: require

requirejs 'should'

assert = requirejs 'assert'
async = requirejs 'async'

describe 'server repositories', ->

  ObjectID = requirejs('mongodb').ObjectID
  connectionString = 'mongodb://localhost:27017/liren-test'

  describe 'base repository', ->

    BaseRepository = requirejs 'server/repositories/base-repository'
    baseRepository = new BaseRepository connectionString, 'test'
    docs = [
      {
        name: 'doc1'
      }
      {
        name: 'doc2'
      }
    ]

    beforeEach (done) ->
      baseRepository.init (error) ->
        if error then throw error
        async.each docs, (doc, callback) ->
          baseRepository.insert doc, callback # we cannot pass baseRepository.insert as argument because it will lose context
        , (error) ->
          if error then throw error
          done()

    it 'should find doc by id', (done) ->
      doc = docs[0]
      wrongId = new ObjectID
      baseRepository.findById doc._id, (error, result) ->
        if error then throw error
        result.should.have.property 'name'
        result.name.should.equal doc.name
        baseRepository.findById wrongId, (error, result) ->
          if error then throw error
          assert.equal null, result
          done()

    it 'should insert doc', (done) ->
      doc =
        name: 'test doc'
      baseRepository.insert doc, (error) ->
        if error then throw error
        doc.should.have.property '_id'
        doc._id.should.be.an.instanceof ObjectID
        baseRepository.findById doc._id, (error, result) ->
          if error then throw error
          result.should.have.property 'name'
          result.name.should.equal doc.name
          done()

    it 'should update doc', (done) ->
      doc = docs[0]
      changedName = 'changed doc'
      baseRepository.findById doc._id, (error, result) ->
        if error then throw error
        result.should.have.property 'name'
        result.name.should.equal doc.name
        doc.name = changedName
        baseRepository.update doc, (error) ->
          if error then throw error
          baseRepository.findById doc._id, (error, result) ->
            if error then throw error
            result.should.have.property 'name'
            result.name.should.equal changedName
            done()

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
      wrongEmail = 'wrong-email@gmail.com'
      userRepository.findByEmail user.email, (error, doc) ->
        if error then throw error
        doc.should.have.property 'email'
        doc.email.should.equal user.email
        doc.should.have.property 'details'
        doc.details.should.equal user.details
        userRepository.findByEmail wrongEmail, (error, doc) ->
          if error then throw error
          assert.equal null, doc
          done()

    it 'should stop inserting user with an existing email', (done) ->
      user = users[0]
      userRepository.insert user, (error) ->
        error.should.not.be.null
        done()