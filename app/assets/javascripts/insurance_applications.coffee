(->
  window.InsuranceApplications or  (window.InsuranceApplications = {})

  InsuranceApplications.chosen_select_init = ->
    $('.chosen-select').select2()

  InsuranceApplications.disable_all_fields = ->
    $("form:not(#new_client) :input").prop('readonly', true);
    $("form :input[type=radio], form select, form :input[type=checkbox]").attr('disabled', true);

  InsuranceApplications.launch_modal = ->
    $('#sign-in-modal').modal 'show'

  InsuranceApplications.show_signup_fields = ->
    $('#sign-up-fields').click () ->
      $('.sign-in-body').addClass 'hidden'
      $('.sign-up-body').removeClass 'hidden'

  InsuranceApplications.show_signin_fields = ->
    $('#sign-in-fields').click () ->
      $('.sign-in-body').removeClass 'hidden'
      $('.sign-up-body').addClass 'hidden'

).call this
