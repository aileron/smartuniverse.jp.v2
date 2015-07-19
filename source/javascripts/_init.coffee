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
    beforeMove: (index,pos) ->
      console.log(pos)

      video.pause()

      section = $('.main section')[ index - 1 ]
      $section = $(section)
      if $section.hasClass("fadeIn")
        $section.hide()
        $section.find("[data-fade-in]").each ->
          $(this).hide()

    afterMove: (index,pos) ->
      console.log(pos)
      play = -> 
        video.currentTime = 0
        video.play()
      setTimeout play, 800

      section = $('.main section')[ index - 1 ]
      $section = $(section)
      $section.addClass('show')
      console.log("load #{section.className}")
      if $section.hasClass("fadeIn")
        $section.delay(500).fadeIn 1250, ->
          $section.find("[data-fade-in]").each ->
            msec = $(this).data("fade-in")
            $(this).fadeIn(msec)

    loop: false
    keyboard: true
    responsiveFallback: false
    direction: 'vertical'
