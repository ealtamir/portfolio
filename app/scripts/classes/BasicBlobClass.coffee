define [
  './AbstractBlobClass',
  '../eventAggregator',
  '../helpers'
  '../constants'
  '../renderer'
], (AbstractBlob, eventAggregator, h, c, renderer) ->
  class BasicBlob extends AbstractBlob
    constructor: (x, y, radius)->
      if not x?
        x = h.rand 0, c.VP_WIDTH
      if not y?
        y = h.rand 0, c.VP_HEIGHT
      if not radius?
        radius = h.rand 0, c.MAX_RADIUS

      super(x, y, radius)

      eventAggregator.one(
        c.events.INITIALIZE_BLOBS,
        _.bind(@initBlob, @)
      )

      @genTickWaitCount()

      renderer.addToRenderList @blobId, @getPos(), @getRad()

    tickAction: ->
      if @reduceTickCount() is 0
        new_pos = @calcNextBlobPos()
        console.log "Handled blob #{@blobId}."

    initBlob: ->
      @listenTick()

