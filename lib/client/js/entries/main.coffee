requirejs.config
  baseUrl: "/js"
  paths:
    "async": "lib/async"
    "backbone": "lib/backbone"
    "bootstrap": "lib/bootstrap"
    "handlebars.runtime": "lib/handlebars.runtime-v1.1.2"
    "holder": "lib/holder"
    "jquery": "lib/jquery-1.10.2"
    "templates": "templates/main/templates"
    "underscore": "lib/underscore"
  shim:
    "backbone":
      deps: ["underscore"]
      exports: "Backbone"
    "bootstrap":
      deps: ["jquery"]
    "handlebars.runtime":
      exports: "Handlebars"
    "holder":
      exports: "Holder"
    "templates":
      deps: ["handlebars.runtime"]
    "underscore":
      exports: "_"

requirejs [
  "backbone"
  "jquery"
  "routers/main-router"
], (Backbone, $, MainRouter) ->
  $ ->
    new MainRouter
    Backbone.history.start()