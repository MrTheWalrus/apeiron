(function () {
  "use strict";

  var self = Apeiron.Systems.environmental = {};

  self.onDocumentReady = function(){
    Apeiron.home.logLines([
      ["<span class='heading'>Environmental Systems Report</span>", 100],
      ["Gardens: <span class='bad'>Ecosystems damaged</span>",200],
      ["Secondary Life Support: <span class='good'>Online</span>",200],
      ["- Atmosphere Management: <span class='good'>Stable</span>",200],
      ["- Temperature Control: <span class='good'>Stable</span>",200],
      ["- Radiation Shielding: <span class='good'>Stable</span>",200],
      ["Internal Transit Network: <span class='good'>Moderate Delays on Track C</span>",200]
    ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('systems');
    });
  }
}());