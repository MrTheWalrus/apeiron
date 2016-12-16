// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

(function () {
  "use strict";

  var self = Apeiron.admin = {};

  self.onDocumentReady = function(){
    //The main interface probably shouldn't even be loaded, but meh.
    Apeiron.home.setStatus("admin"); 

    //For each table, enable the edit link opening the form, and the cancel button closing it.
    //TODO: Submit forms via AJAX and update row based on response.
    $.each(['project', 'resource', 'faction', 'event', 'mission'], function(index, model){
      $(('.edit-'+model)).click(function(e){
        e.preventDefault();
        $(this).parents('tr').hide();
        $($(this).attr('id').replace('edit-'+model, '#'+model+'-form')).show();
      });
      $('button.cancel-'+model+'-form').click(function(e){
        e.preventDefault();
        $(this).parents('tr').hide();
        $($(this).attr('id').replace(model+'-cancel-button', '#'+model+'-row')).show();
      });
    });

  }
}());