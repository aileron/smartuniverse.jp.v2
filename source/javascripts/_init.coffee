$ ->
  $(window).on 'touchmove.noScroll', (e)->
    e.preventDefault()

  $("#news-readmore").click ->
    $("#news-more").fadeIn()
  $(".close").click ->
    $(this).parent("article").fadeOut()

  $('.main').onepage_scroll
    sectionContainer: 'section'
    easing: 'ease'
    animationTime: 1000
    pagination: true
    updateURL: true
    beforeMove: (index) ->
      document.querySelector(".News video").currentTime = 0;

      section = $('.main section')[ index - 1 ]
      $section = $(section)
      if $section.hasClass("fadeIn")
        $section.hide()
        $section.find("[data-fade-in]").each ->
          $(this).hide()

    afterMove: (index) ->
      section = $('.main section')[ index - 1 ]
      $section = $(section)
      $section.addClass('show')
      console.log("load #{section.className}")
      if $section.hasClass("fadeIn")
        $section.fadeIn 1250, ->
          $section.find("[data-fade-in]").each ->
            msec = $(this).data("fade-in")
            $(this).fadeIn(msec)

    loop: false
    keyboard: true
    responsiveFallback: false
    direction: 'vertical'
