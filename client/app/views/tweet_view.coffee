View = require './view'
application = require 'application'
template = require 'views/templates/tweet'
Tweet = require 'models/tweet'

module.exports = class TweetView extends View
  id: 'tweet-view'
  template: template

  render: ->
    console.log @id
    console.log 'get tweet json'
    console.log template()


  initialize: ->
    @model = new Tweet
    @model.view = this
    @model.bind 'change', @render
    console.log @model

  getRenderData: ->
    {
      term: @model.toJSON()
    }


