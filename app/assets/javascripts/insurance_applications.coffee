(->
  window.InsuranceApplications or  (window.InsuranceApplications = {})

  InsuranceApplications.chosen_select_init = ->
    $('.chosen-select').select2()

  InsuranceApplications.disable_all_fields = ->
    $("form:not(#new_client) :input").prop('readonly', true);
    $("form :input[type=radio], form select, form :input[type=checkbox]").attr('disabled', true);

  InsuranceApplications.launch_modal = ->
    $('#alert-modal').modal 'show'

  InsuranceApplications.show_signup_fields = ->
    $('#sign-up-fields').click () ->
      $('.sign-in-body').addClass 'hidden'
      $('.sign-up-body').removeClass 'hidden'

  InsuranceApplications.show_signin_fields = ->
    $('#sign-in-fields').click () ->
      $('.sign-in-body').removeClass 'hidden'
      $('.sign-up-body').addClass 'hidden'

  InsuranceApplications.init_sidebar_scroll = ->
    $('body').scrollspy
      target: '#insurance-application-sidebar'
      offset: 90
    $('#insurance-application-sidebar a[href^="#"]').on 'click', (e) ->
      e.preventDefault()
      target = @hash
      $target = $(target)
      $('html, body').stop().animate { 'scrollTop': $target.offset().top - 90 }, 900, 'swing', ->
      return

  InsuranceApplications.toggle_modal_fields = ->
    $('.modal-login-rb').change ->
      if @value == "existing_account"
        $('.sign-in-body').removeClass 'hidden'
        $('.sign-up-body').addClass 'hidden'
      else
        $('.sign-in-body').addClass 'hidden'
        $('.sign-up-body').removeClass 'hidden'
).call this
