define [
  '../eventAggregator',
  '../constants'
], (eventAggregator, c) ->
  class Timer
    constructor: (@tick_time) ->
      if not @tick_time >= 0
        @stop_tick = no
        @tick_interval = setInterval @tick, @tick_time
      else
        console.log "Tick time must be greater than 0."

    tick: ->
      if @stop_tick is yes
        clearInterval(@tick_interval)
      else
        eventAggregator.trigger c.events.TICK, @tick_time
