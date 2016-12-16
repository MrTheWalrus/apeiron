// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

(function () {
  "use strict";

  var self = Apeiron.admin = {};

  self.onDocumentReady = function(){
    //The main interface probably shouldn't even be loaded, but meh.
    Apeiron.home.setStatus("admin"); 

    $('.edit-project').click(function(e){
      e.preventDefault();
      $(this).parents('tr').hide();
      var formSelector = $(this).attr('id').replace('edit-project', '#project-form')
      console.log(formSelector);
      $(formSelector).show();
    });
    $('button.cancel-project-form').click(function(e){
      e.preventDefault();
      $(this).parents('tr').hide();
      var rowSelector = $(this).attr('id').replace('cancel-button', '#project-row')
      $(rowSelector).show();
    });
  }
}());