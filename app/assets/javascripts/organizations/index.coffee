CRM.organizationsIndex =
  init: () ->
    console.log("orgainzation index Initailized")

    $("[data-mode-selector='mode-task'] li span").on "click", (event) => @handleMode(event)

    $("[data-day-selector='day-task'] li span").on "click",(event) => @handleDay(event)

    $("[data-user-selector='user-assign-task'] li span").on "click",(event) => @handleTask(event)

  handleMode: (event) ->

    $("[data-mode-selector='mode-task'] li span").removeClass("label-primary")
    value=$(event.currentTarget).closest('li').attr("data-mode-option")
    console.log(value)

    if value=="due"
      $("[data-day-selector='day-task'] li").hide()
      $("[data-day-selector='day-task'] li").each ->
        name = $(this).attr("data-day-option")
        if(name=="all" || name=="overdue" ||name=="yesterday"  || name=="today" || name=="tomorrow")
          $(this).show()
    else
      $("[data-day-selector='day-task'] li").hide();
      $("[data-day-selector='day-task'] li").each ->
        name = $(this).attr("data-day-option")
        if(name=="all" || name=="earlier" ||  name=="yesterday" || name=="today" )
          $(this).show()

    $(event.currentTarget).addClass("label-primary")
    $("#mode").val(value)
    $("#filter_form").submit()

  handleDay: (event) ->

    day=$(event.currentTarget).closest('li').attr("data-day-option")
    $("[data-day-selector='day-task'] li span").removeClass("label-primary")
    $(event.currentTarget).addClass("label-primary")
    $("#day").val(day)
    $("#filter_form").submit()

  handleTask: (event) ->
    
    $("[data-user-selector='user-assign-task'] li span").removeClass("label-primary")
    $(event.currentTarget).addClass("label-primary")
    value=$(event.currentTarget).closest('li').attr("data-user-id")
    $("#user").val(value)
    $("#filter_form").submit()

$(document).on "turbolinks:load", ->
  return unless $(".organizations.index").length > 0
  CRM.organizationsIndex.init()
