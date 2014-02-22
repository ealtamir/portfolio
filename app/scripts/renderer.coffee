define [
  'domHandler'
  'lodash'
  './eventAggregator'
  './constants'
  './helpers'
], ($, _, eventAggregator, c, h) ->
  class Renderer
    renderList: []

    blobTemplate: _.template """
      <div id="blob-<%- id %>">
        <i class="ion ion-record f_s_10"></i>
      </div>
    """

    constructor: ->
      eventAggregator.one(
        c.events.UPDATE_HTML,
        _.bind(@addRenderListToHTML, @)
      )

    addToRenderList: (id, point, radius) ->
      @renderList.push
        html: blobTemplate(id: id)
        pos: point
        rad: radius
        id: id

    addRenderListToHTML: ->
      $blobs_zone = $(c.anchor.BLOB_SECTION)
      renderStr = ""
      (renderStr += blob.html + '\n') for blob in @renderList

      console.log renderStr

      $blobs_zone.append renderStr

      $("#blob-#{blob.id}").css(
        left  : blob.pos.x
        top   : blob.pos.y
      ) for blob in @renderList

      @signalHTMLUpdated()

    signalHTMLUpdated: ->
      eventAggregator.trigger c.events.HTML_UPDATED


  # Singleton
  if renderer? then renderer else (renderer = new Renderer())
