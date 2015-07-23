$ ->
  theWindow = $(window)
  $bg = $('#bg')
  $at = $('#bg + article')

  $('head').append "<style id='article-position'></style>"
  $atp = $('#article-position')

  resize_img = ->
    aspectRatio = $bg.width() / $bg.height()
    if theWindow.width() / theWindow.height() < aspectRatio
      $bg.removeClass().addClass 'height'
      bw = $bg.width()
      bh = $bg.height()
      aw = bw * 0.38
      $atp.html ".atp{font-size:#{aw}px; top: #{bh * 0.30}px; right:#{bw * 0.12}px}"

    else
      $bg.removeClass().addClass 'width'
      bw = $bg.width()
      bh = $bg.height()
      aw = bw * 0.38
      $atp.html ".atp{font-size:#{aw}px; top: #{bh * 0.30}px; right:#{bw * 0.11}px}"


  $(window).on 'loaded', resize_img
  $(window).on 'resize', resize_img
