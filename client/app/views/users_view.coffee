View = require './view'
application = require 'application'
template = require 'views/templates/users'


module.exports = class UsersView extends View
  template: template

  # print out list of users

  initialize: ->
    fakeUsers = ['@fakeuser', '@bag', 'kitten']
    application.users.bind 'all', @renderD3
    #application.users.bind 'change', @renderD3
    #$(fakeUsers).each (a) ->
      #a.users.create ({handle:@})

    application.users.add handle:userHandle, {silent:true} for userHandle in fakeUsers

    #@users.create('p')
    @renderD3()
    @forceJs()

  renderD3: ->
    #console.log 'render data'
    #console.log application.users
    application.users.forEach (individualUser) ->
      console.log individualUser.get('handle')
      #console.log @.models[0].attributes.handle
    console.log 'render d3'

  forceJs: ->
    console.log 'force js'
    width = 960
    height = 500

    color = d3.scale.category20

    force = d3.layout.force()
      .charge(-120)
      .linkDistance(30)
      .size([width, height])

    svg = d3.select("body").append("svg")
      .attr("width", width)
      .attr("height", height)

    nodes = []
    links = []

    application.users.forEach (individualUser) ->
      newNode =
        index : nodes.length
        x : width/2 + nodes.length
        y : height/2
        px : width/2 + nodes.length
        py : height/2
        fixed : false
        weight : 2      # number of edges, we're in a circle for now
        handle : individualUser.get('handle')
      nodes.push newNode

      newLink =
        source : links.length
        target : (links.length + 1) % application.users.length
   #   console.log "newLink" 
    #  console.log newLink
      links.push newLink

   # console.log nodes
   # console.log "links"
   # console.log links

    force
      .nodes(nodes)
      .links(links)
      .start()
   # console.log force.nodes(nodes).links(link).start()

    link = svg.selectAll("line.link")
      .data(links)
      .enter().append("line")
      .attr("class", "link")
      .style "stroke-width", (d) ->  
        Math.sqrt(4)

    node = svg.selectAll("circle.node")
      .data(nodes)
      .enter().append("circle")
      .attr("class", "node")
      .attr("r", 5)
      .style "fill", (d) -> 
        color(2)
      .call(force.drag)

    force.on "tick", ->
      link.attr("x1", (d) -> d.source.x)
          .attr("y1", (d) -> d.source.y)
          .attr("x2", (d) -> d.target.x)
          .attr("y2", (d) -> d.target.y)

      node.attr("cx", (d) -> d.x )
          .attr("cy", (d) -> d.y )






