$(document).on("turbolinks:load", function(){
    $("#select_form option").on("change", function() {
      $(this).submit();
    });

   $("#select_form1 select").on("change", function() {
    $(this).submit();
   });

    $("#select_form2 select").on("change", function() {
     $(this).submit();
    });

    $("[data-Mode-selector='Mode-task'] li span").on("click",function(){
      var value=$(this).closest('li').attr('data-due-option');
      $("#due").val(value);
      $("#filter_form").submit();
    });

    $("[data-complete-selector='complete-task'] li span").on("click",function(){
        var value=$(this).closest('li').attr('data-complete-option');
        $("#complete").val(value)
        $("#filter_form").submit();
    });

});
