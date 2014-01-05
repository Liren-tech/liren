define [
  'server/repositories/base-repository'
], (BaseRepository) ->

  class UserRepository extends BaseRepository

    constructor: (connectionString) ->
      super connectionString, 'user'

    init: (callback) ->
      that = @
      super (error) ->
        if error
          if callback and 'function' is typeof callback then callback error
          return
        that.collection (error, db, collection) ->
          collection.ensureIndex 'email',
            w: 1
            unique: true
          , (error) ->
            db.close()
            if callback and 'function' is typeof callback then callback error

    findByEmail: (email, callback) ->
      @collection (error, db, collection) ->
        if error
          if callback and 'function' is typeof callback then callback error
          return
        collection.findOne
          email: email
        , (error, doc) ->
          db.close()
          if callback and 'function' is typeof callback then callback error, doc

  UserRepository