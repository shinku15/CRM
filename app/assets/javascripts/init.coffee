window.CRM ||= {}

CRM.init = ->
 console.log("CRM app Initailized")

 $('.datetimepicker').datetimepicker({
   format: 'DD-MM-YYYY HH:mm:ss',
 });

$(document).on "turbolinks:load", ->
  CRM.init()
