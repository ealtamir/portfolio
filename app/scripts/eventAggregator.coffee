require ['asEvented' ], (asE) ->
  Obj = ->
  asE.call Obj.prototype
  console.log "Creating new event aggregator"

  # Created the event aggregator
  new Obj()
