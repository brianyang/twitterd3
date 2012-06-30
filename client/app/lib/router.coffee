application = require 'application'

module.exports = class Router extends Backbone.Router
  routes:
    '': 'home'

  home: ->
    #$('body').append application.homeView.render().el
    $('body').append application.termView.render().el
    #$('body').append application.usersView.render().el
