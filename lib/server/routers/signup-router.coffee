define [
  'express'
  'common/services/input-check-service'
  'server/services/password-hash-service'
  'server/repositories/user-repository'
], (express, inputCheckService, passwordHashService, userRepository) ->

  route = (app) ->

    app.post '/signup', express.bodyParser(), (req, res) ->
      user =
        email: req.body.email
        password: req.body.password
      inputCheckService.checkEmail user.email, (error, result) ->
        if error or not result
          res.send 401,
            msg: '邮箱或密码错误。'
          return
        inputCheckService.checkPassword user.password, (error, result) ->
          if error or not result
            res.send 401,
              msg: '邮箱或密码错误。'
            return
          userRepository.findByEmail user.email, (error, doc) ->
            if error or doc
              res.send 401,
                msg: '邮箱已经被注册。'
              return
            passwordHashService.hash user.password, (error, hashedPassword) ->
              if error
                res.send 500,
                  msg: '服务器错误。'
                return
              user.password = hashedPassword
              userRepository.insert user, (error) ->
                if error
                  res.send 500,
                    msg: '服务器错误。'
                  return
                res.send 200, user

  {
    route: route
  }