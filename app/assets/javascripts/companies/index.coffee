CRM.companyIndex =
  init: () ->
    console.log("company index Initailized")
    callback = ->
      $("#search").submit()
    $('#email, #name').keyup $.debounce(250,callback)

 $(document).on "turbolinks:load", ->
   return unless $(".companies.index").length > 0
   CRM.companyIndex.init()
