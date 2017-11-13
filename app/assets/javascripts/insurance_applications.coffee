(->
  window.InsuranceApplications or  (window.InsuranceApplications = {})

  InsuranceApplications.chosen_select_init = ->
    $('.chosen-select').select2()

  InsuranceApplications.disable_all_fields = ->
    $("form:not(#new_client) :input").prop('readonly', true);
    $("form :input[type=radio], form select, form :input[type=checkbox]").attr('disabled', true);

  InsuranceApplications.launch_modal = ->
    $('#sign-in-modal').modal 'show'

  InsuranceApplications.toggle_modal_fields = ->
    $('.modal-login-rb').change ->
      if @value == "existing_account"
        $('.sign-in-body').removeClass 'hidden'
        $('.sign-up-body').addClass 'hidden'
      else
        $('.sign-in-body').addClass 'hidden'
        $('.sign-up-body').removeClass 'hidden'
).call this
