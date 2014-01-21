define [
  'mongodb'
  'server/repositories/book-repository'
], (MongoDb, BookRepository) ->

  ObjectID = MongoDb.ObjectID

  route = (app) ->

    app.get '/books', (req, res) ->
      bookRepository = new BookRepository
      bookRepository.find (error, books) ->
        if error or not books
          res.send 404
          return
        res.send books

    app.get '/books/:id', (req, res) ->
      bookRespository = new BookRepository
      id = new ObjectID req.params.id
      bookRespository.findById id, (error, book) ->
        if error or not book
          res.send 404
          return
        res.send book

  {
    route: route
  }