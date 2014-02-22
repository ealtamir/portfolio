define [], ->
  {
    events:
      TICK         :  'tick'
      UPDATE_HTML  :  'update_html'
      HTML_UPDATED :  'html_updated'

    anchor:
      BLOBS_SECTION: '#blobs-section'

    TICK_TIME: 500
    NUM_OF_BLOBS: 20
    VP_WIDTH: Math.max(
      document.documentElement.clientWidth,
      window.innerWidth || 0
    )
    VP_HEIGHT: Math.max(
      document.documentElement.clientHeight,
      window.innerHeight || 0
    )
    MAX_RADIUS: 100
  }
