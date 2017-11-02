(function () {
  "use strict";

  var self = Apeiron.Systems.transit = {};

  self.onDocumentReady = function(){
    Apeiron.home.logLines([
      ["<span class='heading'>Transit System Registry</span>", 100],
      ["System Registry 0: Sublight Engines", 200],
      [" - Drive Status: <span class='good'>Online - Drives standing by</span>", 200],
      ["System Registry 1: Hyperdrive", 200],
      [" - Drive Configuration: <span class='key'>Class One</span>", 200],
      [" - Drive Status: <span class='warn'>Online - Activation on planetary surface not recommended.</span>", 200],
      ["System Registry 2: Navigation", 200],
      [" - Starmap Status: <span class='warn'>Online - Star maps updating.</span>", 200],
      ["System Registry 3: Etheric Wake Drive", 200],
      [" - Wake Fins: <span class='good'>Stable</span>", 200],
      [" - Fold Core: <span class='warn'>Unverified Configuration</span>", 100]
    ]);
    $('ul.log').one('finished', function(){
      Apeiron.home.setStatus('systems');
    });
  }

}());