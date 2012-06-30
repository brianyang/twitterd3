View = require './view'
application = require 'application'
template = require 'views/templates/users'


module.exports = class UsersView extends View
  template: template

  # print out list of users

  initialize: ->
    fakeUsers = ['@fakeuser', '@bag']
    application.users.bind 'all', @renderD3
    application.users.bind 'change', @renderD3
    #$(fakeUsers).each (a) ->
      #a.users.create ({handle:@})

    application.users.add({handle:userHandle}) for userHandle in fakeUsers
    #console.log application
    #console.log application.termView
    #console.log application.users

    #console.log application.users.create ({@: 'tmp'})
    #application.users.add {handle:'foo'}
    #@users.create('p')

  renderD3: ->
    console.log 'render data'
