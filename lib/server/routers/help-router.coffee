define ->

  route = (app) ->

    app.get '/help', (req, res) ->
      res.render 'help'

  {
    route: route
  }