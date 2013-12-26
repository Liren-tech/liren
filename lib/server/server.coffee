define [
  'consolidate'
  'express'
], (consolidate, express) ->

  start = ->

    app = express()

    app.set 'view engine', 'hbs'
    app.set 'views', './lib/server/views'

    app.engine 'hbs', consolidate.handlebars

    app.use express.static './lib/client'
    app.use express.cookieParser()

    requirejs('server/routers/base-router').route app
    requirejs('server/routers/signup-router').route app
    requirejs('server/routers/login-router').route app

    app.listen 10080

  {
    start: start
  }