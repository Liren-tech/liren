define [
  'server/repositories/base-repository'
], (BaseRepository) ->

  class UserRepository extends BaseRepository

    collection: (callback) ->
      @connect (error, db) ->
        if error
          if callback and 'function' is typeof callback then callback error
          return
        collection = db.collection 'user', (error, collection) ->
          if error
            db.close()
            if callback and 'function' is typeof callback then callback error
            return
          if callback and 'function' is typeof callback then callback null, db, collection

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

    removeAll: (callback) ->
      @collection (error, db, collection) ->
        if error
          if callback and 'function' is typeof callback then callback error
          return
        collection.remove null, {w: 1}, (error, count) ->
          db.close()
          if callback and 'function' is typeof callback then callback error, count

  UserRepository