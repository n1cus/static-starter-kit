
jQuery(function() {
  return $('.play').click(function() {
    var audio;
    audio = $(this).next('audio');
    if (audio != null) return $(audio).get(0).play();
  });
});
