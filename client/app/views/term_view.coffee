View = require './view'
application = require 'application'
template = require 'views/templates/term'
Term = require 'models/term'

module.exports = class TermView extends View
  id: 'term-view'
  template: template

  events:
    'click #term-btn': 'termBtnEvent'

  initialize: ->
    @model = new Term
    @model.view = this
    @model.bind 'change', @render

  termBtnEvent: ->
    #console.log 'term btn event'
    termInputVal = $('#term-input').val()
    #@model.set({term:termInputVal})
    #console.log 'at model' + @mode
    #console.log application
    #console.log application.terms
    @model.set({searchword:termInputVal})
    console.log @model.attributes.term

  getRenderData: ->
    {
      term: @model.toJSON()
    }


