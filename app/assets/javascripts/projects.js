(function () {
  "use strict";

  var self = Apeiron.projects = {};

  self.onDocumentReady = function(){
    $('.res').click(function(element){
      console.log(this);
      $('.res-desc').show();
      // TODO: I don't think this works in IE.
      $('.res-desc').html($(this).data()['description']);
    })
    Apeiron.home.logLines([
      ["Project GUI loaded. Press [<span class='key'>ESC</span>] to exit.", 200]
     ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('projects');
    });
  }
}());