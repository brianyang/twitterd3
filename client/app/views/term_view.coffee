View = require './view'
application = require 'application'
template = require 'views/templates/term'
Term = require 'models/term'

module.exports = class TermView extends View
  #model: Term
  id: 'term-view'
  template: template

  events:
    'click #term-btn': 'termBtnEvent'

  initialize: ->
    @model = new Term
    @model.view = this
    @model.bind 'change', @render
    console.log 'init change'
    #console.log @model

  termBtnEvent: ->
    #console.log 'term btn event'
    termInputVal = $('#term-input').val()
    #@model.set({term:termInputVal})
    #console.log 'at model' + @model
    #console.log application
    #console.log application.terms
    @model.set({searchword:termInputVal})
    console.log @model.attributes.term

  getRenderData: ->
    {
      term: @model.toJSON()
    }


