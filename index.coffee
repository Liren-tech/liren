path = require 'path'
requirejs = require 'requirejs'

requirejs.config
  baseUrl: path.join __dirname, 'lib'
  nodeRequire: require

requirejs [
  'server/server'
], (server) ->
  server.start()