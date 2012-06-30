# The application bootstrapper.
Application =
  initialize: ->
    HomeView = require 'views/home_view'
    Router = require 'lib/router'
    UserView = require 'views/user_view'

    # Ideally, initialized classes should be kept in controllers & mediator.
    # If you're making big webapp, here's more sophisticated skeleton
    # https://github.com/paulmillr/brunch-with-chaplin
    @homeView = new HomeView()
    @userView = new UserView()

    # Instantiate the router
    @router = new Router()
    # Freeze the object
    Object.freeze? this

module.exports = Application
