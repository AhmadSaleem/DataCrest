(->
  $(window).resize ->
    if $(window).width() > 992
      $('#dashboard-sidebar').show()
      $('#sidebar-toggler').removeClass 'collapse'
    else
      $('#dashboard-sidebar').hide()
).call this
