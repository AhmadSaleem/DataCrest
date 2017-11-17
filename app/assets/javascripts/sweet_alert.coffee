(->
  window.SweetAlert or  (window.SweetAlert = {})

  SweetAlert.init = ->
    $(".remove-employee").on 'click', (e) ->
      e.preventDefault()
      personId = $(this).attr("data-id")
      swal({
        title: 'Are you sure?'
        text: 'Do you really want to remove this employee?'
        type: 'question'
        showCancelButton: true
        confirmButtonClass: 'btn-danger'
        confirmButtonText: 'Remove'
        cancelButtonText: 'Cancel'
      }).then (result) ->
          linkId = "#person-#{personId}"
          $(linkId).click()
).call this
