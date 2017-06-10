(function () {
  "use strict";

  var self = Apeiron.Systems.transit = {};

  self.onDocumentReady = function(){
    Apeiron.home.logLines([
      ["<span class='heading'>Transit System Registry</span>", 100],
      ["System Registry 0: Sublight Engines", 200],
      [" - Drive Status: <span class='bad'>Offline - Security Interlock Enabled - Hull integrity compromised.</span>", 200],
      ["System Registry 1: Hyperdrive", 200],
      [" - Drive Configuration: <span class='key'>Class One</span>", 200],
      [" - Drive Status: <span class='bad'>Offline - insufficient power</span>", 200],
      ["System Registry 2: Navigation", 200],
      [" - Starmap Status: <span class='bad'>Offline - insufficient power</span>", 200],
      ["System Registry 3: Etheric Wake Drive", 200],
      [" - Wake Fins: <span class='warn'>Under Construction</span>", 200],
      [" - Fold Core: <span class='warn'>Awaiting Configuration</span>", 100]
    ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('systems');
    });
  }

}());