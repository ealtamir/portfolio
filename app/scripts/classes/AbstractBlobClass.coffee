define [
  'lodash'
  '../domHandler'
  '../eventAggregator'
  '../constants'
  '../helpers'
], (_, $, eventAggregator, c, h) ->
  class AbstractBlob
    @blobIdCount: 0

    constructor: (@x, @y, @radius) ->
      @listeningToTick = no
      @blobId = @getBlobId()

      @startTickListener()

    setPos: (x, y) ->
      if x? and y?
        [@x, @y] = [x, y]
      else
        null

    getPos: ->
      { x: @x, y: @y }

    getRad: ->
      @radius

    setRad: (radius) ->
      @radius = radius

    listenTick: ->
      @listeningToTick = yes

    ignoreTick: ->
      @listeningToTick = no

    tickAction: ->
      console.log "Must be implemented by subclasses."
      null

    getBlobId: ->
      count = AbstractBlob.blobIdCount
      AbstractBlob.blobIdCount += 1
      count

    startTickListener: ->
      eventAggregator.bind c.events.TICK, _.bind(@tickHandler, this)

    tickHandler: ->
      if @listeningToTick is yes
        @tickAction()

    genTickWaitCount: (start, end) ->
      if start? and end?
        @tick_count = h.rand start, end
      else
        @tick_count = h.rand 0, c.TICK_WAIT_COUNT

    getTickCount: ->
      @tick_count

    reduceTickCount: (num) ->
      if num? and num <= @tick_count
        @tick_count -= num
      else
        @tick_count -= 1

      if @tick_count is 0
        @genTickWaitCount()
        0
      else
        @tick_count

    initBlob: ->
      console.log "Must be implemented by subclass"
      null
