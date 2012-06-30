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
    #application.users.forEach (individualUser) ->
    #  console.log individualUser.get('handle')

  forceJs: ->
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
      idx = nodes.length
      newNode =
        index : idx
        x : width/2 + idx
        y : height/2 + idx*idx      # square it so points don't end up on a line
        px : width/2 + idx
        py : height/2 + idx*idx
        fixed : false
        weight : 2      # number of edges, we're in a circle for now
        handle : individualUser.get('handle')
      nodes.push newNode

      newLink =
        source : links.length
        target : (links.length + 1) % application.users.length
      links.push newLink

    force
      .nodes(nodes)
      .links(links)
      .start()

    link = svg.selectAll("line.link")
      .data(links)
      .enter().append("line")
      .attr("class", "link")
      .style "stroke", (d) ->
        "#999"
      .style "stroke-width", (d) ->
        2

    node = svg.selectAll("circle.node")
      .data(nodes)
      .enter().append("circle")
      .attr("class", "node")
      .attr("r", 5)
      .style "fill", (d) ->
          color(2)
      .call(force.drag)

    circles = svg.selectAll("circle").each (d) ->
        d.textEl = svg.append("svg:text")
        .attr("x", d.x+10)
        .attr("y", d.y+10)
        .style("font-size", "18 px")
        .style("fill", "#5C5C5C").text => d.handle


    force.on "tick", ->
      link.attr("x1", (d) -> d.source.x)
          .attr("y1", (d) -> d.source.y)
          .attr("x2", (d) -> d.target.x)
          .attr("y2", (d) -> d.target.y)

      node.attr("cx", (d) -> d.x )
          .attr("cy", (d) -> d.y )

      circles.each (d)  ->
        c = d3.select(this)
        d.textEl
            .attr("x", c.attr("cx"))
            .attr("y", c.attr("cy"))







