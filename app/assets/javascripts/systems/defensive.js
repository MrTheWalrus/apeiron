(function () {
  "use strict";

  var self = Apeiron.Systems.defensive = {};

  self.onDocumentReady = function(){
    Apeiron.home.logLines([
      ["<span class='heading'>Defensive System Registry</span>", 100],
      ["System Registry 0: Shields", 100],
      [" - Shield Region 1: <span class='bad report-status'>Offline - Insufficient Power</span>", 100],
      [" - Shield Region 2: <span class='bad report-status'>Offline - Insufficient Power</span>", 100],
      [" - Shield Region 3: <span class='bad report-status'>Offline - Insufficient Power</span>", 100],
      [" - Shield Region 4: <span class='warn report-status'>Offline - Shield regulator replacement underway</span>", 100],
      ["System Registry 1: Automated Repair Systems: <span class='bad report-status'>Offline - Insufficient Power</span>", 400],
      ["System Registry 3: Sentinel Repair Drones: <span class='warn power-no-system'>&lt;System Boot Failed&gt;</span>", 200]
    ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('systems');
    });
  }

}());