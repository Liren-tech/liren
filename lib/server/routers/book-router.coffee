define [
  'server/middlewares/auth-middleware'
  'server/repositories/book-repository'
], (auth, BookRepository) ->

  route = (app) ->

    app.get '/books', auth(), (req, res) ->
      bookRepository = new BookRepository
      bookRepository.find (error, books) ->
        if error or not books
          res.send 404
          return
        res.send books

  {
    route: route
  }