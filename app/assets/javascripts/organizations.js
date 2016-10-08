$(document).on("turbolinks:load", function(){
    $("#select_form option").on("change", function() {
      $(this).submit();
    });
});

$(document).on("turbolinks:load", function(){
   $("#select_form1 select").on("change", function() {
    $(this).submit();
   });
 });

 $(document).on("turbolinks:load", function(){
    $("#select_form2 select").on("change", function() {
     $(this).submit();
    });
  });
