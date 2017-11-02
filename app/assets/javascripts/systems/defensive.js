(function () {
  "use strict";

  var self = Apeiron.Systems.defensive = {};

  self.onDocumentReady = function(){
    Apeiron.home.logLines([
      ["<span class='heading'>Defensive System Registry</span>", 100],
      ["System Registry 0: Shields", 100],
      [" - Shield Region 1: <span class='good report-status'>100%</span>", 100],
      [" - Shield Region 2: <span class='good report-status'>100%</span>", 100],
      [" - Shield Region 3: <span class='good report-status'>100%</span>", 100],
      [" - Shield Region 4: <span class='good report-status'>100%</span>", 100],
      ["System Registry 1: Automated Repair Systems: <span class='good report-status'>Online</span>", 400],
      ["System Registry 3: Sentinel Repair Drones: <span class='good'>Online - No repairs scheduled</span>", 200]
    ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('systems');
    });
  }

}());