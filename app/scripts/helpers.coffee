define [], ->
  getFuncName: (func) ->
    ret = func.toString()
    ret = ret.substr 'function '.length
    ret.substr 0, ret.indexOf('(')

  rand: (lowerBnd, upperBnd) ->
    if upperBnd > lowerBnd
      result = Math.random() * (upperBnd - lowerBnd)
      Math.floor(result) + lowerBnd
    else
      console.log """
        Cant get a random number between #{upperBnd} and #{lowerBnd}.
      """
      null
