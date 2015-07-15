$ ->
  $(".Career").livequery ->
    #$(this).fadeIn(300)

  $('.main').onepage_scroll
    sectionContainer: 'section'
    easing: 'ease'
    animationTime: 1000
    pagination: true
    updateURL: true
    beforeMove: (index) ->
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
