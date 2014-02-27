define [
  'lodash'
  '../eventAggregator'
  '../constants'
  '../helpers'
], (_, eventAggregator, c, h) ->
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

    calcNextBlobPos: (x, y, radius) ->
      correct_new_pos_found = no
      count = 2
      while not correct_new_pos_found and count > 0
        angle = Math.random() * 2 * Math.PI
        new_rad = h.rand(0, c.MAX_RADIUS)
        new_x = x + Math.cos(angle) * new_rad
        new_y = y + Math.sin(angle) * new_rad
        if 0 < new_x < c.VP_WIDTH and 0 < new_y < c.VP_HEIGHT
          correct_new_pos_found = yes
        else
          count -= 1
      { x: new_x, y: new_y }
