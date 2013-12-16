{exec} = require 'child_process'
path = require 'path'

coffeePath = path.join 'node_modules', '.bin', 'coffee'
libFolder = 'lib'
testFolder = 'test'

task 'build', 'build the whole project', ->
  console.log 'build index.coffee'
  exec "#{coffeePath} -c index.coffee"
  console.log 'build lib scripts'
  exec "#{coffeePath} -c #{libFolder}"
  console.log 'build test scripts'
  exec "#{coffeePath} -c #{testFolder}"