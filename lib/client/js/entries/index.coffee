requirejs.config
  baseUrl: "/js"
  paths:
    "bootstrap": "lib/bootstrap"
    "handlebars.runtime": "lib/handlebars.runtime-v1.1.2"
    "holder": "lib/holder"
    "jquery": "lib/jquery-1.10.2"
    "templates": "templates/templates"
  shim:
    "bootstrap":
      deps: ["jquery"]
    "handlebars.runtime":
      exports: "Handlebars"
    "holder":
      exports: "Holder"
    "templates":
      deps: ["handlebars.runtime"]

requirejs [
  "handlebars.runtime"
  "holder"
  "jquery"
  "bootstrap"
  "templates"
], (Handlebars, Holder, $) ->
  $ ->
    $body = $ "body"
    $body.append Handlebars.templates["header"]()
    $body.append Handlebars.templates["index"]()
    $body.append Handlebars.templates["footer"]()
    Holder.run()