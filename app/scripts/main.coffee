#/*global require*/
'use strict'

require.config
  shim:
    bonzo:
      deps: ['qwery']
    lodash:
      exports: '_'
    tweenlite:
      exports: 'TweenLite'
      deps: ['cssplugin']

  paths:
    asevented: './asevented'
    qwery: '../bower_components/qwery/qwery'
    bonzo: '../bower_components/bonzo/bonzo'
    lodash: '../bower_components/lodash/dist/lodash'
    tweenlite: '../bower_components/tweenlite/TweenLite.min'
    cssplugin: '../bower_components/tweenlite-css/CSSPlugin.min'

require [
  './eventMediator'
  './classes/Timer',
  './classes/Board',
  './constants'
],
  (EventMediator, Timer, Board, c) ->
    console.dir c
    timer = new Timer(c.TICK_TIME)
    board = new Board(c.NUM_OF_BLOBS)
