define [
  './AbstractBlobClass',
  './BasicBlobClass'
  '../helpers'
], (AbstractBlob, BasicBlob, h) ->
  hidden = do ->
    classTypes = [
      BasicBlob
    ]
    private_methods =
      typesArray: classTypes
      typesTable: do ->
        table = {}
        (table[h.getFuncName(f)] = f) for f in classTypes
        table

  blobFactory = (type) ->
    if type?
      classType = hidden.typesTable[type]

    if classType?
      new classType()
    else
      randomType = h.rand 0, hidden.typesArray.length
      new inner.typesArray[randomType]()
