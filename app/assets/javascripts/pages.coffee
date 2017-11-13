(->
  window.Pages or  (window.Pages = {})

  Pages.init = ->
    $('#datatables').DataTable
      'pagingType': 'full_numbers'
      'lengthMenu': [
        [
          10
          25
          50
          -1
        ]
        [
          10
          25
          50
          'All'
        ]
      ]
      responsive: true
      language:
        search: '_INPUT_'
        searchPlaceholder: 'Search records'
    table = $('#datatables').DataTable()

    # Edit record
    table.on 'click', '.edit', ->
      $tr = $(this).closest('tr')
      if $tr.hasClass('child')
        $tr = $tr.prev('.parent')
      data = table.row($tr).data()
      alert 'You press on Row: ' + data[0] + ' ' + data[1] + ' ' + data[2] + '\'s row.'

    # Delete a record
    table.on 'click', '.remove', (e) ->
      $tr = $(this).closest('tr')
      table.row($tr).remove().draw()
      e.preventDefault()

    #Like record
    table.on 'click', '.like', ->
      alert 'You clicked on Like button'

).call this
