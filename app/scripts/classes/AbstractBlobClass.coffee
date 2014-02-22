define [
  '../domHandler',
  '../eventAggregator',
  '../constants'
], ($, eventAggregator, c) ->
  class AbstractBlob
    blobIdCount: 0

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
      [@x, @y]

    listenTick: ->
      @listeningToTick = yes

    ignoreTick: ->
      @listeningToTick = no

    tickAction: ->
      console.log "Must be implemented by subclasses."
      null

    getBlobId: ->
      count = @blobIdCount
      @blobIdCount += 1
      count
