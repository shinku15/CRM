$(document).ready(function(){
    $("#select_form select").on("change", function() {
      $(this).submit();
    });
});
