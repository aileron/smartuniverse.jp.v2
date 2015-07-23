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
      $atp.html ".atp{ top: #{$bg.height() * 0.30}px; right:#{$bg.width() * 0.12}px}"

    else
      $bg.removeClass().addClass 'width'
      $atp.html ".atp{ top: #{$bg.height() * 0.30}px; right:#{$bg.width() * 0.11}px}"

  $bg.on 'load', resize_img

  $(window).on 'resize', resize_img
