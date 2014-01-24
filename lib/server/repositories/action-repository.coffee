define [
  'server/repositories/base-repository'
], (BaseRepository) ->

  class ActionRepository extends BaseRepository

    constructor: (connectionString) ->
      super connectionString, 'action'

    init: (callback) ->
      super (error) ->
        if error
          if callback and 'function' is typeof callback then callback error
          return
        @collection (error, db, collection) ->
          collection.ensureIndex 'name', {w: 1}, (error) ->
            db.close()
            if callback and 'function' is typeof callback then callback error

    # TODO: find actions according to business logic.
    find: (callback) ->
      @collection (error, db, collection) ->
        if error
          if callback and 'function' is typeof callback then callback error
          return
        collection.find (error, cursor) ->
          if error
            if callback and 'function' is typeof callback then callback error
            db.close()
            return
          cursor.toArray (error, actions) ->
            db.close()
            if callback and 'function' is typeof callback then callback error, actions

  ActionRepository