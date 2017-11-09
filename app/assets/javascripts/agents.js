$(document).on('turbolinks:load', function() {
  $('.invite-rb').change(function() {
    if(this.value == 'yes'){
      $('#agents').removeAttr('required')
      $('#agent_first_name, #agent_last_name, #agent_email, #agency_code, #agent_agent_code').attr('required', true)
      $('#existing-agent-fields').addClass('hidden')
      $('#new-agent-fields').removeClass('hidden')
      $('#applications-div').addClass('hidden')
    }
    else{
      $('#agent_first_name, #agent_last_name, #agent_email, #agency_code, #agent_agent_code').removeAttr('required')
      $('#agents').attr('required', true)
      $('#existing-agent-fields').removeClass('hidden')
      $('#new-agent-fields').addClass('hidden')
      $('.chosen-select').select2()
      $('#applications-div').addClass('hidden')
    }
  });

  $('.include-app').change(function() {
    if(this.checked) {
      $('#applications-div').removeClass('hidden');
    }
    else {
      $('#applications-div').addClass('hidden');
    }
  });
});
