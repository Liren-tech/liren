define [
  'mongodb'
  'server/repositories/action-repository'
], (MongoDb, ActionRepository) ->

  ObjectID = MongoDb.ObjectID

  route = (app) ->

    app.get '/actions', (req, res) ->
      actionRepository = new ActionRepository
      actionRepository.find (error, actions) ->
        if error or not actions
          res.send 404
          return
        res.send actions

    app.get '/actions/:id', (req, res) ->
      actionRepository = new ActionRepository
      id = new ObjectID req.params.id
      actionRepository.findById id, (error, action) ->
        if error or not action
          res.send 404
          return
        res.send action

  {
    route: route
  }