(function () {
  "use strict";

  var self = Apeiron.projects = {};

  self.onDocumentReady = function(){
    $('.res').click(function(){
      $('.res-desc').show();
      // TODO: I don't think this works in IE.
      $('.reset').show();
      $('.res-desc').html($(this).data()['description']);
    });
    $('.reset').click(function(){
      $('.res-desc').hide();
      $('.reset').hide();
    });
    $('.project-item').click(function(){
      $(this).find('.project-expand').toggle();
    });
    Apeiron.home.logLines([
      ["Project GUI loaded. Press [<span class='key'>ESC</span>] to exit.", 200]
     ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('projects');
    });
  }
}());