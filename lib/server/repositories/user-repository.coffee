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

    insert: (user, callback) ->
      @collection (error, db, collection) ->
        if error
          if callback and 'function' is typeof callback then callback error
          return
        collection.insert user, {w: 1}, (error, user) ->
          db.close()
          if callback and 'function' is typeof callback then callback error, user

    remove: (selector, callback) ->
      @collection (error, db, collection) ->
        if error
          if callback and 'function' is typeof callback then callback error
          return
        collection.remove selector, {w: 1}, (error, count) ->
          db.close()
          if callback and 'function' is typeof callback then callback error, count

    findOne: (selector, callback) ->
      @collection (error, db, collection) ->
        if error
          if callback and 'function' is typeof callback then callback error
          return
        collection.findOne selector, (error, doc) ->
          db.close()
          if callback and 'function' is typeof callback then callback error, doc

  UserRepository