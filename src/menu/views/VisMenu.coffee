MenuBuilder = require "../menubuilder"
dom = require "../../utils/dom"

module.exports = ImportMenu = MenuBuilder.extend

  initialize: (data) ->
    @g = data.g
    @el.style.display = "inline-block"
    @listenTo @g.vis, "change", @render

  render: ->
    @setName("Vis. elements")

    visElements = @getVisElements()
    for visEl in visElements
      @_addVisEl visEl

    # other
    @addNode "Reset", =>
      @g.vis.set "labels", true
      @g.vis.set "sequences", true
      @g.vis.set "metacell", true
      @g.vis.set "conserv", true
      @g.vis.set "labelId", true
      @g.vis.set "labelName", true
      @g.vis.set "labelCheckbox", false

    @addNode "Toggle mouseover events", =>
      @g.config.set "registerMouseHover", !@g.config.get "registerMouseHover"

    # TODO: make more efficient
    dom.removeAllChilds @el
    @el.appendChild @buildDOM()
    @

  _addVisEl: (visEl) ->
    style = {}

    if @g.vis.get visEl.id
      pre = "Hide "
      style.color = "red"
    else
      pre = "Show "
      style.color = "green"

    @addNode (pre + visEl.name), =>
      @g.vis.set visEl.id, ! @g.vis.get visEl.id
    ,
      style: style

  getVisElements: ->
    vis = []
    vis.push name: "Markers", id: "markers"
    vis.push name: "Labels", id: "labels"
    vis.push name: "Sequences", id: "sequences"
    vis.push name: "Meta info", id: "metacell"
    vis.push name: "Overviewbox", id: "overviewbox"
    vis.push name: "conserv", id: "conserv"
    vis.push name: "LabelName", id: "labelName"
    vis.push name: "LabelId", id: "labelId"
    vis.push name: "LabelCheckbox", id: "labelCheckbox"
    return vis