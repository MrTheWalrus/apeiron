(function () {
  "use strict";

  var self = Apeiron.Systems.defensive = {};

  self.onDocumentReady = function(){
    Apeiron.home.logLines([
      ["System Registry 0: Shields", 100],
      [" - Shield Sector 1: <span class='bad report-status'>Offline - Insufficient Power</span>", 100],
      [" - Shield Sector 2: <span class='bad report-status'>Offline - Insufficient Power</span>", 100],
      [" - Shield Sector 3: <span class='bad report-status'>Offline - Insufficient Power</span>", 100],
      [" - Shield Sector 4: <span class='bad report-status'>Offline - Shield regulator is damaged or missing</span>", 100],
      [" - Shield Sector 5: <span class='bad report-status'>Offline - Insufficient Power</span>", 100],
      [" - Shield Sector 6: <span class='bad report-status'>Offline - Insufficient Power</span>", 100],
      ["System Registry 1: Automated Repair Systems: <span class='bad report-status'>Offline - Insufficient Power</span>", 400],
      ["System Registry 2: <span class='bad power-no-system'>&lt;Error: No such system/system not configured&gt;</span>", 200]
    ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('systems');
    });
  }

}());