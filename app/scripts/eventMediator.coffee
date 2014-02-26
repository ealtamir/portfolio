define [
  './eventAggregator'
  './constants'
], (eventAggregator, c) ->
  class EventMediator
    constructor: ->
      eventAggregator.bind c.events.BOARD_BLOBS_LOADED, ->
        eventAggregator.trigger(c.events.UPDATE_HTML)

      eventAggregator.bind c.events.HTML_UPDATED, ->
        eventAggregator.trigger(c.events.INITIALIZE_BLOBS)

  # Singleton
  if event_med? then event_med else (event_med = new EventMediator())
