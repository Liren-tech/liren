define [
  'mongodb'
], (MongoDb) ->

  MongoClient = MongoDb.MongoClient

  class BaseRepository

    constructor: (connectionString) ->
      @_connectionString = if connectionString then connectionString else 'mongodb://localhost:27017/liren'

    connect: (callback) ->
      MongoClient.connect @_connectionString, callback

  BaseRepository