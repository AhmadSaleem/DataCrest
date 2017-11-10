(->
  window.InsuranceApplications or  (window.InsuranceApplications = {})

  InsuranceApplications.chosen_select_init = ->
    $('.chosen-select').select2()

).call this
