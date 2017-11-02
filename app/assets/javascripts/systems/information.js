(function () {
  "use strict";

  var self = Apeiron.Systems.information = {};

  self.onDocumentReady = function(){
    Apeiron.home.logLines([
      ["<span class='heading'>Info/Comm Systems Report</span>", 100],
      ["Primary Shipboard AI: <span class='good'><i><b>APEIRON EGEO. PARATUS NOU ANI.</b></i></span>", 300],
      ["Emergency Shipboard AI: <span class='good'>\"We stand ready, Novitas\"</span>", 300],
      ["Auxiliary AI: <span class='warn'>Thoth is Eternal, Mortals.</span>", 300],
      ["Deep Memory Conduits: <span class='good'>Archives Active</span>", 100],
      ["Shipyard Command Link: <span class='good'>Online - Active</span>", 100],
      ["Intraship Communications: <span class='good'>Online</span>", 100],
      ["Intership Communications: <span class='good'>Online - No signals detected</span>", 100],
    ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('systems');
    });
  }
}());