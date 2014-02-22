#/*global require*/
'use strict'

require.config
  shim:
    bonzo:
      deps: ['qwery']
    lodash:
      exports: '_'

  paths:
    asevented: './asevented'
    qwery: '../bower_components/qwery/qwery'
    bonzo: '../bower_components/bonzo/bonzo'
    lodash: '../bower_components/lodash/dist/lodash'

require [
  './classes/Timer',
  './classes/Board',
  './constants'
],
  (Timer, Board, c) ->
    console.dir c
    #timer = new Timer(c.TICK_TIME)
    #board = new Board(c.NUM_OF_BLOBS)
