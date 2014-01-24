define ->

  route = (app) ->

    app.get '/', (req, res) ->
      res.render 'index'

  {
    route: route
  }