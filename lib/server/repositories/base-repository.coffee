define [
  'mongodb'
], (MongoDb) ->

  MongoClient = MongoDb.MongoClient

  class BaseRepository

    constructor: (connectionString, name) ->
      @_connectionString = if connectionString then connectionString else 'mongodb://localhost:27017/liren'
      @_name = name

    collection: (callback) ->
      name = @_name
      MongoClient.connect @_connectionString, (error, db) ->
        if error
          if callback and 'function' is typeof callback then callback error
          return
        db.collection name, (error, collection) ->
          if error
            db.close()
            if callback and 'function' is typeof callback then callback error
            return
          if callback and 'function' is typeof callback then callback null, db, collection

    init: (callback) ->
      @collection (error, db, collection) ->
        if error
          if callback and 'function' is typeof callback then callback error
          return
        collection.remove null, {w: 1}, (error) ->
          db.close()
          if callback and 'function' is typeof callback then callback error

    findById: (id, callback) ->
      @collection (error, db, collection) ->
        if error
          if callback and 'function' is typeof callback then callback error
          return
        collection.findOne
          _id: id
        , (error, doc) ->
          db.close()
          if callback and 'function' is typeof callback then callback error, doc

    insert: (doc, callback) ->
      @collection (error, db, collection) ->
        if error
          if callback and 'function' is typeof callback then callback error
          return
        collection.insert doc, {w: 1}, (error) ->
          db.close()
          if callback and 'function' is typeof callback then callback error

    update: (doc, callback) ->
      @collection (error, db, collection) ->
        if error
          if callback and 'function' is typeof callback then callback error
          return
        collection.update
          _id: doc._id
        , doc, {w: 1}, (error) ->
          db.close()
          if callback and 'function' is typeof callback then callback error