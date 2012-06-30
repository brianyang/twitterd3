# The application bootstrapper.
Application =
  initialize: ->
    Router = require 'lib/router'
    Users = require 'models/users'
    HomeView = require 'views/home_view'
    TermView = require 'views/term_view'
    UsersView = require 'views/users_view'
    #TweetView = require 'views/tweet_view'

    # Ideally, initialized classes should be kept in controllers & mediator.
    # If you're making big webapp, here's more sophisticated skeleton
    # https://github.com/paulmillr/brunch-with-chaplin
    @users = new Users()
    @homeView = new HomeView()
    @termView = new TermView()
    @usersView = new UsersView()
    #@tweetView = new TweetView()
    #console.log 'app'
    #console.log @termView


    # Instantiate the router
    @router = new Router()
    # Freeze the object
    Object.freeze? this

module.exports = Application
