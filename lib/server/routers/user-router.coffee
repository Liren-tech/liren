define [
  'underscore'
  'server/middlewares/auth-middleware'
], (_, auth) ->

  route = (app) ->

    app.get '/user', auth(), (req, res) ->
      user = _.clone req.user
      delete user.password # never send password to client
      res.send user

  {
    route: route
  }