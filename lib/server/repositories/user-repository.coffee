define [
  'server/repositories/base-repository'
], (BaseRepository) ->

  class UserRepository extends BaseRepository

    collection: (callback) ->
      @connect (error, db) ->
        if error
          if callback and 'function' is typeof callback then callback error
          return
        db.collection 'user', (error, collection) ->
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
          if error
            db.close()
            if callback and 'function' is typeof callback then callback error
            return
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

    insert: (user, callback) ->
      @collection (error, db, collection) ->
        if error
          if callback and 'function' is typeof callback then callback error
          return
        collection.insert user, {w: 1}, (error, user) ->
          db.close()
          if callback and 'function' is typeof callback then callback error, user

    update: (user, callback) ->
      @collection (error, db, collection) ->
        if error
          if callback and 'function' is typeof callback then callback error
          return
        collection.update
          _id: user._id
        , user, {w: 1}, (error, count) ->
            db.close()
            if callback and 'function' is typeof callback then callback error, count

  UserRepository