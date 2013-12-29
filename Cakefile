{exec} = require 'child_process'
path = require 'path'
_ = require 'underscore'

coffeePath = path.join 'node_modules', '.bin', 'coffee'
handlebarsPath = path.join 'node_modules', '.bin', 'handlebars'
libFolder = 'lib'
templatesBaseFolder = path.join 'lib', 'client', 'js', 'templates'
templatesFolders = ['index', 'main']
testFolder = 'test'

task 'build', 'build the whole project', ->
  console.log 'build index.coffee'
  exec "#{coffeePath} -c index.coffee"
  console.log 'build lib scripts'
  exec "#{coffeePath} -c #{libFolder}"
  console.log 'build templates'
  _.each templatesFolders, (folder) ->
    templatesFolder = path.join templatesBaseFolder, folder
    exec "#{handlebarsPath} #{templatesFolder} -e hbs -f #{path.join templatesFolder, 'templates.js'}"
  console.log 'build test scripts'
  exec "#{coffeePath} -c #{testFolder}"