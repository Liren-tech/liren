define [
  'express'
  'server/services/password-hash-service'
  'server/repositories/user-repository'
], (express, passwordHashService, UserRepository) ->

  route = (app) ->

    app.post '/login', express.bodyParser(), (req, res) ->
      user =
        email: req.body.email
        password: req.body.password
      userRepository = new UserRepository
      userRepository.findByEmail user.email, (error, doc) ->
        if error or not doc
          res.send 401, '邮箱或密码错误'
          return
        passwordHashService.validate user.password, doc.password, (error, result) ->
          if error or not result
            res.send 401, '邮箱或密码错误'
            return
          res.cookie 'liren_user', doc._id.toHexString()
          res.send 200

  {
    route: route
  }