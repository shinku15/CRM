// $(document).on("turbolinks:load", function(){
//     $("[data-mode-selector='mode-task'] li span").on("click",function(){
//       $("[data-mode-selector='mode-task'] li span").removeClass("label-primary")
//       var value=$(this).closest('li').attr("data-mode-option")
//       console.log(value)
//       if(value=="due")
//       {
//         $("[data-day-selector='day-task'] li").hide();
//         $("[data-day-selector='day-task'] li").each(function(){
//           var name=$(this).attr("data-day-option");
//           if(name=="all" || name=="overdue" ||name=="yesterday"  || name=="today" || name=="tomorrow")
//           {
//             $(this).show();
//
//           }
//         });
//       }
//       else
//       {
//         $("[data-day-selector='day-task'] li").hide();
//         $("[data-day-selector='day-task'] li").each(function(){
//           var name=$(this).attr("data-day-option");
//           if(name=="all" || name=="earlier" ||  name=="yesterday" || name=="today" )
//           {
//             $(this).show();
// 
//           }
//         });
//       }
//
//       $(this).addClass("label-primary")
//       $("#mode").val(value);
//       $("#filter_form").submit();
//     });
//
//     $("[data-day-selector='day-task'] li span").on("click",function(){
//       var day=$(this).closest('li').attr("data-day-option")
//       $("[data-day-selector='day-task'] li span").removeClass("label-primary")
//       $(this).addClass("label-primary")
//       $("#day").val(day);
//       $("#filter_form").submit();
//     });
//
//     $("[data-user-selector='user-assign-task'] li span").on("click",function(){
//       $("[data-user-selector='user-assign-task'] li span").removeClass("label-primary")
//         $(this).addClass("label-primary")
//       var value=$(this).closest('li').attr("data-user-id")
//       $("#user").val(value)
//       $("#filter_form").submit();
//     });
//   });
