# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


$(document).ready(function() {
  function displayVals(){
    var serviceValue = $(#static_pages_category_id).val();
    }
      if serviceValue =! nil
        $(#subNavAppt).removeClass('hide').addClass('show');
      });

  $("select").change( displayVals);
    displayVals();

