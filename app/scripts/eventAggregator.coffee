require ['asEvented' ], (asE) ->
  Obj = ->
  asE.call Obj.prototype

  # Created the event aggregator
  new Obj()
