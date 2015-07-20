$ ->
  #$(window).on 'resize', (e)->
  #  console.log Math.sqrt(window.height * window.width) 

  video =  document.querySelector(".News video")
  video.addEventListener "ended", ->
    play = -> 
      video.currentTime = 0
      video.play()
    setTimeout play, 7000

  $('html').fitText()
  $(window).on 'resize', (e)->
    $('html').fitText()

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

    beforeMove: (index) ->
      video.pause()
      lng =$('#lang a')
      lng.attr 'href', lng.attr('href').split('#')[0] + location.hash

    afterMove: (index) ->
      play = -> 
        video.currentTime = 0
        video.play()
      setTimeout play, 500

    loop: false
    keyboard: true
    responsiveFallback: false
    direction: 'vertical'

