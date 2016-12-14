// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
(function () {
  "use strict";

  var self = Apeiron.missions = {};

  self.onDocumentReady = function(){
    $('.mission-item').click(function(){
      $(this).find('.mission-expand').toggle();
    });
    Apeiron.home.logLines([
      ["Mission reports loaded. Press [<span class='key'>ESC</span>] to exit.", 200]
     ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('missions');
    });
  }
}());