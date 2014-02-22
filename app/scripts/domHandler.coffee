define [
  'bonzo',
  'qwery'
], (bonzo, qwery) ->
  # Has to use this hack in order to create abstract
  # the call to bonzo + qwery. Tried to do this on
  # main, by using init, but I couldn't get it to work :(
  (selector) ->
    bonzo qwery selector
