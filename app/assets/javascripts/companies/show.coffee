CRM.companyShow =
  init: () ->
    console.log("company show Initailized")
    $("#lead_form select").on "change", ->
      $(this).submit()

 $(document).on "turbolinks:load", ->
   return unless $(".companies.show").length > 0
   CRM.companyShow.init()
