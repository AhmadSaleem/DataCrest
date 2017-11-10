(->
  window.Applications or  (window.Applications = {})

  Applications.chosen_select_init = ->
    $('.chosen-select').select2()

).call this
