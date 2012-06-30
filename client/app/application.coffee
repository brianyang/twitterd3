# The application bootstrapper.
Application =
  initialize: ->
    HomeView = require 'views/home_view'
    Router = require 'lib/router'
    TermView = require 'views/term_view'
    UsersView = require 'views/users_view'
    Users = require 'models/users'

    # Ideally, initialized classes should be kept in controllers & mediator.
    # If you're making big webapp, here's more sophisticated skeleton
    # https://github.com/paulmillr/brunch-with-chaplin
    @homeView = new HomeView()
    @termView = new TermView()
    @usersView = new UsersView()
    @users = new Users()
    #console.log 'app'
    #console.log @termView


    # Instantiate the router
    @router = new Router()
    # Freeze the object
    Object.freeze? this

module.exports = Application
