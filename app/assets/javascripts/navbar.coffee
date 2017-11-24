(->
  window.Navbar or (window.Navbar = {})

  Navbar.init = ->
    $('#search').on 'click', ->
      if $(window).width() > 992
        if $('.navbar-search-form').hasClass('hidden')
          $('.navbar-search-form').addClass 'navbar-left'
          $('.navbar-search-form').removeClass 'hidden'
        else
          $('.navbar-search-form').removeClass 'navbar-left'
          $('.navbar-search-form').addClass 'hidden'
      else
        if $('.navbar-search-form').hasClass('hidden')
          $('.navbar-search-form').removeClass 'navbar-left'
          $('.navbar-search-form').removeClass 'hidden'
        else
          $('.navbar-search-form').removeClass 'navbar-left'
          $('.navbar-search-form').addClass 'hidden'

).call this
