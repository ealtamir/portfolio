define [], ->
  {
    events:
      TICK                :  'tick'
      UPDATE_HTML         :  'update_html'
      HTML_UPDATED        :  'html_updated'
      BOARD_BLOBS_LOADED  :  'board_blobs_loaded'
      INITIALIZE_BLOBS    :  'initialize_blobs'

    html_anchors:
      BLOBS_SECTION: '#blobs-section'

    TICK_WAIT_COUNT  :  20
    TICK_TIME        :  500
    NUM_OF_BLOBS     :  20
    MAX_RADIUS       :  100

    # Hack used to get the height and width
    # of the viewport
    VP_WIDTH: Math.max(
      document.documentElement.clientWidth,
      window.innerWidth || 0
    )
    VP_HEIGHT: Math.max(
      document.documentElement.clientHeight,
      window.innerHeight || 0
    )
  }
