(function () {
  "use strict";

  var self = Apeiron.Systems.information = {};

  self.onDocumentReady = function(){
    Apeiron.home.logLines([
      ["<span class='heading'>Info/Comm Systems Report</span>", 100],
      ["Primary Shipboard AI: <span class='bad'>Offline - Power conservation mode</span>", 100],
      ["Emergency Shipboard AI: <span class='warn'>Online - Minor damage to memory banks detected</span>", 100],
      ["Deep Memory Conduits: <span class='bad'>Offline - Insufficient power</span>", 100],
      ["Shipyard Command Link: <span class='good'>Online - Active</span>", 100],
      ["Intraship Communications: <span class='good'>Online</span>", 100],
      ["Intership Communications: <span class='bad'>Offline - Power conservation mode</span>", 100],
    ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('systems');
    });
  }
}());