Model = require './model'

module.exports = class Tweet extends Model
  defaults:
    content: 'tweet content'
