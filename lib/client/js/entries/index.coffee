requirejs.config
  baseUrl: "/js"
  paths:
    "async": "lib/async"
    "backbone": "lib/backbone"
    "bootstrap": "lib/bootstrap"
    "handlebars.runtime": "lib/handlebars.runtime-v1.1.2"
    "holder": "lib/holder"
    "jquery": "lib/jquery-1.10.2"
    "templates": "templates/index/templates"
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
  "common/global"
  "routers/index-router"
  "views/index/header-view"
  "views/index/footer-view"
], (Backbone, $, global, IndexRouter, HeaderView, FooterView) ->

  $ ->

    headerView = new HeaderView
    $("header").html headerView.$el
    headerView.render()
    global.headerView = headerView

    footerView = new FooterView
    $("footer").html footerView.$el
    footerView.render()
    global.footerView = footerView

    global.contentView = null

    new IndexRouter

    Backbone.history.start()