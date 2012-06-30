View = require './view'
application = require 'application'
template = require 'views/templates/users'


module.exports = class UsersView extends View
  template: template

  # print out list of users

  initialize: ->
    fakeUsers = ['@fakeuser', '@bag']

    #$(fakeUsers).each (a) ->
      #a.users.create ({handle:@})

    #application.users.create({handle:userHandle}) for userHandle in fakeUsers
    console.log application
    console.log application.termView
    console.log application.users

    #application.users.create({handle:'tmp'})


