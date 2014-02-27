define [
  'tweenlite'
  'domHandler'
  'lodash'
  './eventAggregator'
  './constants'
  './helpers'
], (TweenLite, $, _, eventAggregator, c, h) ->
  class Renderer
    renderList: []

    blobTemplate: _.template """
      <span class="blob" id="blob-<%- id %>">
        <i class="ion ion-record f_s_3"></i>
      </span>
    """

    constructor: ->
      eventAggregator.one(
        c.events.UPDATE_HTML,
        _.bind(@addRenderListToHTML, @)
      )

    addToRenderList: (id, point, radius) ->
      @renderList.push
        html: @blobTemplate(id: id)
        pos: point
        rad: radius
        id: id

    addRenderListToHTML: ->
      $blobs_zone = $(c.html_anchors.BLOBS_SECTION)
      renderStr = ""
      (renderStr += blob.html + '\n') for blob in @renderList

      $blobs_zone.append renderStr

      $("#blob-#{blob.id}").css(
        left  : blob.pos.x
        top   : blob.pos.y
      ) for blob in @renderList

      @signalHTMLUpdated()

    signalHTMLUpdated: ->
      eventAggregator.trigger c.events.HTML_UPDATED

    updateBlob: (blobId, new_pos) ->
      new TweenLite("#blob-#{blobId}", 2, {css: {
        left: "#{new_pos.x}px"
        top: "#{new_pos.y}px"
      }, ease: "Power4.easeIn"})

  # Singleton
  if renderer? then renderer else (renderer = new Renderer())
