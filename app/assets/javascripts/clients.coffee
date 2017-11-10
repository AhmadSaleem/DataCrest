(->
  window.Clients or (window.Clients = {})

  Clients.client_fields_init = ->
    $('.invite-rb').change ->
      if @value == 'yes'
        $('#clients').removeAttr 'required'
        $('#client_first_name, #client_last_name, #client_email').attr 'required', true
        $('#existing-client-fields').addClass 'hidden'
        $('#new-client-fields').removeClass 'hidden'
      else
        $('#client_first_name, #client_last_name, #client_email').removeAttr 'required'
        $('#clients').attr 'required', true
        $('#existing-client-fields').removeClass 'hidden'
        $('#new-client-fields').addClass 'hidden'
        $('.chosen-select').select2()
).call this
