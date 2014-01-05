define [
  'server/repositories/base-repository'
], (BaseRepository) ->

  class BookRepository extends BaseRepository

    constructor: (connectionString) ->
      super connectionString, 'book'

    init: (callback) ->
      super (error) ->
        if error
          if callback and 'function' is typeof callback then callback error
          return
        @collection (error, db, collection) ->
          collection.ensureIndex 'name', {w: 1}, (error) ->
            db.close()
            if callback and 'function' is typeof callback then callback error

  BookRepository