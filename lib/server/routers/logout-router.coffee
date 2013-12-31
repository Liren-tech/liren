define [
  'server/middlewares/auth-middleware'
], (auth) ->

  route = (app) ->

    app.get '/logout', auth(
      failAction: (req, res) ->
        res.send 200
    ), (req, res) ->
      res.clearCookie 'liren_user'
      res.send 200

  {
    route: route
  }