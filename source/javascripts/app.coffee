jQuery ->
  $('.play').click ->
    audio = $(this).next('audio')
    if audio?
      $(audio).get(0).play()
