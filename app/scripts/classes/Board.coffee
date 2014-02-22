define [
  '../eventAggregator',
  './BlobClassFactory'
],
  (eventAggregator, blobFactory) ->
  class Board
    constructor: (@num_of_blobs) ->
      @addBlob(blobFactory()) for i in [0...@num_of_blobs]

    addToBoard: (blob) ->
      @board.push blob

    getFromBoard: (index) ->
      len = @board.length
      if not index? and len isnt 0
        @board[0] # Return first element by default
      else if 0 <= index < len
        @board[index]
      else if len is 0
        null
      else
        console.log "Board index out of bounds."
        null

    removeFromBoard: (index) ->
      if @board.length is 0
        null
      else if 0 <= index < @board.length
        el = @board[index]
        @board.splice index, 1
        el
      else
        console.log "Board index out of bounds."
        null
