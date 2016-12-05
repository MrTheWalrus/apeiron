(function () {
  "use strict";

  var self = Apeiron.Systems.transit = {};

  self.onDocumentReady = function(){
    Apeiron.home.logLines([
      ["System Registry 0: Sublight Engines", 200],
      [" - Drive Status: <span class='bad'>Offline - Security Interlock Enabled - Hull integrity compromised.</span>", 200],
      ["System Registry 1: Hyperdrive", 200],
      [" - Drive Configuration: <span class='key'>Class One</span>", 200],
      [" - Drive Status: <span class='bad'>Offline - insufficient power</span>", 200],
      ["System Registry 2: Navigation", 200],
      [" - Starmap Status: <span class='bad'>Offline - insufficient power</span>", 200],
      ["System Registry 3: <span class='bad no-system'>&lt;Error: No such system/system not configured&gt;</span>", 200]
    ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('systems');
    });
  }

}());