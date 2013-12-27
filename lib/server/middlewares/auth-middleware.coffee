define [
  'mongodb'
  'underscore'
  'server/repositories/user-repository'
] (MongoDB, _, UserRepository) ->

  ObjectID = MongoDB.ObjectID
  userRepository = new UserRepository

  defaultOpts =
    key: 'liren_user'
    failAction: (req, res) ->
      res.send 401
    successAction: (req, res, next) ->
      next()

  auth = (opts) ->

    opts = _.defaults opts, defaultOpts

    (req, res, next) ->
      id = req.cookies[opts.key]
      if not id
        opts.failAction req, res, next
        return
      id = new ObjectID id
      userRepository.findById id, (error, doc) ->
        if error or not doc
          opts.failAction req, res, next
          return
        req.user = doc
        opts.successAction req, res, next

  auth