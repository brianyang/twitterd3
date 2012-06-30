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
    termInputVal = $('#term-input').val()
    @model.set({searchword:termInputVal})
    @searchTweets()

  searchTweets: ->
    console.log 'search tweets'

    #$.getJSON "http://search.twitter.com/search.json?callback=?", q: @model.get('searchword'), (data) ->
    $.getJSON "/javascripts/search.json", (data) ->
      #console.log data
      data.results.forEach (tweet) ->
        fromHandle = tweet.from_user
        match = application.users.where({handle: fromHandle})
        #console.log match
        application.users.add handle:fromHandle if not match.length
        #console.log fromHandle if not match.length


  getRenderData: ->
    {
      term: @model.toJSON()
    }


