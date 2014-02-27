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
      deps: ['ease', 'cssplugin']

  paths:
    asevented: './asevented'
    qwery: '../bower_components/qwery/qwery'
    bonzo: '../bower_components/bonzo/bonzo'
    lodash: '../bower_components/lodash/dist/lodash'
    tweenlite: 'http://cdnjs.cloudflare.com/ajax/libs/gsap/1.11.5/TweenLite.min'
    ease: "http://cdnjs.cloudflare.com/ajax/libs/gsap/1.11.5/easing/EasePack.min"
    cssplugin: "http://cdnjs.cloudflare.com/ajax/libs/gsap/1.11.5/plugins/CSSPlugin.min"

require [
  './eventMediator'
  './classes/Timer'
  './classes/Board'
  './constants'
],
  (EventMediator, Timer, Board, c) ->
    timer = new Timer(c.TICK_TIME)
    board = new Board(c.NUM_OF_BLOBS)
