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
  "common/global"
  "models/user"
  "routers/main-router"
  "routers/book-router"
  "views/main/header-view"
  "views/main/footer-view"
], (Backbone, $, global, User, MainRouter, BookRouter, HeaderView, FooterView) ->

  $ ->

    user = new User
    user.fetch()
    global.user = user

    headerView = new HeaderView
      user: user
    $("header").html headerView.$el
    headerView.render()
    global.headerView = headerView

    footerView = new FooterView
    $("footer").html footerView.$el
    footerView.render()
    global.footerView = footerView

    global.contentView = null

    new MainRouter
    new BookRouter

    Backbone.history.start()