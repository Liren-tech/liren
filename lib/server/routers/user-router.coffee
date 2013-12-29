define [
  'server/middlewares/auth-middleware'
], (auth) ->

  route = (app) ->

    app.get '/user', auth(), (req, res) ->
      res.send req.user

  {
    route: route
  }