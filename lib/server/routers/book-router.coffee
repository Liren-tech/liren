define [
  'mongodb'
  'server/middlewares/auth-middleware'
  'server/repositories/book-repository'
], (MongoDb, auth, BookRepository) ->

  ObjectID = MongoDb.ObjectID

  route = (app) ->

    app.get '/books', auth(), (req, res) ->
      bookRepository = new BookRepository
      bookRepository.find (error, books) ->
        if error or not books
          res.send 404
          return
        res.send books

    app.get '/books/:id', auth(), (req, res) ->
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