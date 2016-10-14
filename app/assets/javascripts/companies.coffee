$(document).on "turbolinks:load", ->
  callback = ->
    $("#search").submit()

  $('#email, #name').keyup $.debounce( 250, callback )

  $("#lead_form select, #select_form select").on "change", ->
    $(this).submit()
