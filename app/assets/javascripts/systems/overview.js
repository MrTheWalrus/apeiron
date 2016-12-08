(function () {
  "use strict";

  var self = Apeiron.Systems.overview = {};

  self.onDocumentReady = function(){
    self.menu();
  }

  self.menu = function(){
    Apeiron.home.logLines([
      ["System Details Menu:", 100],
      ["[<span class='key'>P</span>]ower Generation", 100],
      ["[<span class='key'>S</span>]uperstructure", 100],
      ["[<span class='key'>I</span>]nformation & Communications", 100],
      ["[<span class='key'>D</span>]efensive Subsystems", 100],
      ["[<span class='key'>O</span>]ffensive Subsystems", 100],
      ["[<span class='key'>E</span>]nvironmental Status", 100],
      ["[<span class='key'>T</span>]ransit Subsystems", 100],
      ["Press [<span class='key'>Enter</span>] at any time to return to overview, or [<span class='key'>ESC</span>] to exit.", 150]
    ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('systems');
    });
  }

}());