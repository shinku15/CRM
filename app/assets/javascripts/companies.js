// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/


$(document).on("turbolinks:load", function(){

  var callback = function(){
    $("#search").submit();
  };
  $('#email, #name').keyup( $.debounce( 250, callback ) );


  $("#lead_form select, #select_form select").on("change", function() {
    $(this).submit();
  });

});
