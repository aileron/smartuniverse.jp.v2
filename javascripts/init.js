(function() {
  $(function() {
    $(".Career").livequery(function() {});
    return $('.main').onepage_scroll({
      sectionContainer: 'section',
      easing: 'ease',
      animationTime: 1000,
      pagination: true,
      updateURL: true,
      beforeMove: function(index) {
        var $section, section;
        section = $('.main section')[index - 1];
        $section = $(section);
        if ($section.hasClass("fadeIn")) {
          $section.hide();
          return $section.find("[data-fade-in]").each(function() {
            return $(this).hide();
          });
        }
      },
      afterMove: function(index) {
        var $section, section;
        section = $('.main section')[index - 1];
        $section = $(section);
        $section.addClass('show');
        console.log("load " + section.className);
        if ($section.hasClass("fadeIn")) {
          return $section.fadeIn(1250, function() {
            return $section.find("[data-fade-in]").each(function() {
              var msec;
              msec = $(this).data("fade-in");
              return $(this).fadeIn(msec);
            });
          });
        }
      },
      loop: false,
      keyboard: true,
      responsiveFallback: false,
      direction: 'vertical'
    });
  });

}).call(this);
