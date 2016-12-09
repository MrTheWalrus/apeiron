// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
(function () {
  "use strict";

  var self = Apeiron.intel = {};

  self.onDocumentReady = function(){
    Apeiron.home.logLines([
      ["Intel report loaded. Press [<span class='key'>ESC</span>] to exit.", 200]
     ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('intel');
    });
  }
}());