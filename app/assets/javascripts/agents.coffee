(->
  window.Agents or (window.Agents = {})

  Agents.agent_fields_init = ->
    $('.invite-rb').change ->
      if @value == 'yes'
        $('#agents').removeAttr 'required'
        $('#agent_first_name, #agent_last_name, #agent_email, #agency_code, #agent_agent_code').attr 'required', true
        $('#existing-agent-fields, #applications-div').addClass 'hidden'
        $('#new-agent-fields').removeClass 'hidden'
      else
        $('#agent_first_name, #agent_last_name, #agent_email, #agency_code, #agent_agent_code').removeAttr 'required'
        $('#agents').attr 'required', true
        $('#existing-agent-fields').removeClass 'hidden'
        $('#new-agent-fields, #applications-div').addClass 'hidden'
        $('#agents').select2
          minimumInputLength: 2
          placeholder: 'Search by Agency code, agent code, name or email'
          ajax:
            url: '/dashboard/agent_invitations/search_agents'
            dataType: 'json'
            type: 'GET'
            data: (term) ->
              { q: term }
            processResults: (data) ->
              { results: data.results }

          templateResult: formatSelection

  formatSelection = (agent) ->
    $state = $("<span><img src=#{agent.pic} class='img-rounded select2-img'/></span><span>#{agent.text}</span>")
    return $state

  Agents.applications = ->
    $('.include-app').change ->
      if @checked
        $('#applications-div').removeClass 'hidden'
      else
        $('#applications-div').addClass 'hidden'
).call this
