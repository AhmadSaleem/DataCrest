$(document).on('turbolinks:load', function() {
  $('.invite-rb').change(function() {
    if(this.value == 'yes'){
      $('#agents').removeAttr('required')
      $('#agent_first_name, #agent_last_name, #agent_email').attr('required', true)
      $('#existing-agent-fields').addClass('hidden')
      $('#new-agent-fields').removeClass('hidden')
    }
    else{
      $('#agent_first_name, #agent_last_name, #agent_email').removeAttr('required')
      $('#agents').attr('required', true)
      $('#existing-agent-fields').removeClass('hidden')
      $('#new-agent-fields').addClass('hidden')
      $('.chosen-select').select2()
    }
  });
});
