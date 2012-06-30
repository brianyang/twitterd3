View = require './view'
application = require 'application'
template = require 'views/templates/term'

module.exports = class TermView extends View
  #model: Term
  id: 'term-view'
  template: template

  events:
    'click #term-btn': 'termBtnEvent'

  termBtnEvent: ->
    console.log 'term btn event'
    termInputVal = $('#term-input').val()
    #@model.set({term:termInputVal})
    console.log @model
    console.log application
    console.log application.terms

