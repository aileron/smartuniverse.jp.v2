$ ->
  video =  document.querySelector(".News video")
  video.addEventListener "ended", ->
    play = -> 
      video.currentTime = 0
      video.play()
    setTimeout play, 7000

  $(window).on 'touchmove.noScroll', (e)->
    e.preventDefault()

  $("#news-readmore").click ->
    $("#news-more").fadeIn()

  $(".close").click ->
    $(this).parent("div").fadeOut()

  $('.main').onepage_scroll
    sectionContainer: 'section'
    easing: 'ease'
    animationTime: 1000
    pagination: true
    updateURL: true
    beforeMove: null
    afterMove: null
    loop: false
    keyboard: true
    responsiveFallback: false
    direction: 'vertical'
