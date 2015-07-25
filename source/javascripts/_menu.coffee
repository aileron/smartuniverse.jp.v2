$ ->
  resize = ->
    height = $(window).height() * 0.32
    $('.onepage-pagination').css {
      "font-size": height/6
    }
  resize()
  $(window).on 'resize', resize
