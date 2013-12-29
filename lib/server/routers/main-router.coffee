define [
  'server/middlewares/auth-middleware'
], (auth) ->

  route = (app) ->

    app.get '/main', auth(
      failAction: (req, res) ->
        res.redirect '/'
    ), (req, res) ->
      res.render "main"

  {
    route: route
  }