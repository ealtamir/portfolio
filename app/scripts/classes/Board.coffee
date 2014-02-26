define [
  '../eventAggregator'
  './BlobClassFactory'
  '../constants'
],
  (eventAggregator, blobFactory, c) ->
    class Board
      board: []

      constructor: (@num_of_blobs) ->
        @addToBoard(blobFactory()) for i in [0...@num_of_blobs]

        # Send ready to renderer
        eventAggregator.trigger c.events.BOARD_BLOBS_LOADED

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
